FROM factual/docker-base-java

ADD https://archive.cloudera.com/cdh5/ubuntu/trusty/amd64/cdh/cloudera.list /etc/apt/sources.list.d/cloudera.list

RUN curl -s https://archive.cloudera.com/cdh5/ubuntu/trusty/amd64/cdh/archive.key > archive.key && apt-key add archive.key

ADD https://archive.cloudera.com/gplextras5/ubuntu/precise/amd64/gplextras/cloudera.list /etc/apt/sources.list.d/gplextras.list

RUN apt-get update; apt-get install -y hadoop-client hadoop-lzo krb5-user lsof

RUN ln -s /usr/share/java/slf4j-simple-1.7.5.jar /usr/lib/hadoop/lib/

RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*