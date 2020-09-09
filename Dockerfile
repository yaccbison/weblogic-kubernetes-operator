FROM centos
LABEL maintainer="dahai.huang"
ENV REFRESHED_AT 2020-08-21

RUN yum -y install git wget >spark.log 2>&1 && \
    git clone https://github.com/oracle/weblogic-kubernetes-operator
