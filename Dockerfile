FROM factual/docker-base-java

RUN curl -s 'http://archive.cloudera.com/cdh5/ubuntu/trusty/amd64/cdh/cloudera.list' > /etc/apt/sources.list.d/cloudera.list
RUN curl -s http://archive.cloudera.com/cdh5/ubuntu/trusty/amd64/cdh/archive.key > archive.key && apt-key add archive.key
RUN apt-get update; apt-get install -y hadoop-client