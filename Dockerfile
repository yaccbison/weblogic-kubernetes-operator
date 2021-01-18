FROM centos
LABEL maintainer="dahai.huang"
ENV REFRESHED_AT 2020-08-21

RUN yum -y install git wget tar
RUN cd /root/
RUN wget https://download.java.net/java/GA/jdk11/13/GPL/openjdk-11.0.1_linux-x64_bin.tar.gz
RUN tar vzfx openjdk-11.0.1_linux-x64_bin.tar.gz
ENV JAVA_HOME /jdk-11.0.1
ENV PATH $JAVA_HOME/bin:$PATH
RUN java -version
RUN wget https://downloads.apache.org/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz
RUN tar vzfx apache-maven-3.6.3-bin.tar.gz
ENV MAVEN_HOME /apache-maven-3.6.3
ENV PATH ${MAVEN_HOME}/bin:${PATH}
RUN mvn -v
RUN wget https://get.helm.sh/helm-v3.5.0-linux-amd64.tar.gz
RUN tar vzfx helm-v3.5.0-linux-amd64.tar.gz
ENV PATH /linux-amd64:${PATH}
RUN git clone https://github.com/oracle/weblogic-kubernetes-operator
RUN cd weblogic-kubernetes-operator/ && mvn clean install

