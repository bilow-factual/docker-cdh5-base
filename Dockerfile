FROM factual/docker-base-java

RUN curl -s 'http://archive.cloudera.com/cdh5/ubuntu/trusty/amd64/cdh/cloudera.list' > /etc/apt/sources.list.d/cloudera.list
RUN curl -s http://archive.cloudera.com/cdh5/ubuntu/trusty/amd64/cdh/archive.key > archive.key && apt-key add archive.key

RUN echo "deb [arch=amd64] http://archive.cloudera.com/gplextras5/ubuntu/trusty/amd64/gplextras trusty-gplextras5 contrib" > /etc/apt/sources.list.d/gplextras.list
RUN echo "deb-src http://archive.cloudera.com/gplextras5/ubuntu/trusty/amd64/gplextras trusty-gplextras5 contrib" >> /etc/apt/sources.list.d/gplex\
tras.list
RUN curl -s http://archive.cloudera.com/gplextras5/ubuntu/trusty/amd64/gplextras/archive.key > archive.key && apt-key add archive.key

RUN apt-get update; apt-get install -y hadoop-client krb5-user hadoop-lzo

#this silences a bunch of slf4j errors
ENV HADOOP_CLASSPATH=$HADOOP_CLASSPATH:/usr/share/java/slf4j-simple-1.7.5.jar
