FROM factual/docker-base-java

ARG UBUNTU_VERSION_NAME=xenial
ENV CDH_VERSION=5.13 \
    HADOOP_CONF_DIR=/etc/hadoop/conf \
    HADOOP_VERSION=2.6

COPY cloudera.pref /etc/apt/preferences.d/cloudera.pref
RUN echo "deb [arch=amd64] http://archive.cloudera.com/cdh5/ubuntu/$UBUNTU_VERSION_NAME/amd64/cdh $UBUNTU_VERSION_NAME-cdh${CDH_VERSION} contrib" >> /etc/apt/sources.list.d/cloudera.list && \
    echo "deb-src http://archive.cloudera.com/cdh5/ubuntu/$UBUNTU_VERSION_NAME/amd64/cdh $UBUNTU_VERSION_NAME-cdh${CDH_VERSION} contrib" >> /etc/apt/sources.list.d/cloudera.list && \
    echo "deb [arch=amd64] http://archive.cloudera.com/gplextras5/ubuntu/$UBUNTU_VERSION_NAME/amd64/gplextras $UBUNTU_VERSION_NAME-gplextras${CDH_VERSION} contrib" >> /etc/apt/sources.list.d/gplextras.list && \
    echo "deb-src http://archive.cloudera.com/gplextras5/ubuntu/$UBUNTU_VERSION_NAME/amd64/gplextras $UBUNTU_VERSION_NAME-gplextras${CDH_VERSION} contrib" >> /etc/apt/sources.list.d/gplextras.list && \
    curl -sf https://archive.cloudera.com/cdh5/ubuntu/$UBUNTU_VERSION_NAME/amd64/cdh/archive.key > archive.key && \
    apt-key add archive.key && \
    apt-get update && \
    apt-get install -y \
      hadoop-client \
      hadoop-lzo \
      krb5-user \
      lsof

RUN ln -s /usr/share/java/slf4j-simple-1.7.5.jar /usr/lib/hadoop/lib/

RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
