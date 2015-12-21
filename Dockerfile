FROM ubuntu:14.04
MAINTAINER kolyjjj@foxmail.com

RUN uname -a
RUN mkdir /download
WORKDIR /download

# install wget & git
RUN apt-get update && apt-get install -y wget git-all && apt-get clean && rm -rf /var/lib/apt/lists/*

# install java8
RUN wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u65-b17/jdk-8u65-linux-x64.tar.gz
RUN tar -xvzf jdk-8u65-linux-x64.tar.gz
ENV JAVA_HOME /download/jdk1.8.0_65/
ENV PATH /download/jdk1.8.0_65/bin:$PATH
RUN java -version

# install curl and Jenkins
RUN wget -q -O - https://jenkins-ci.org/debian/jenkins-ci.org.key | apt-key add -
RUN echo "deb http://pkg.jenkins-ci.org/debian binary/" > /etc/apt/sources.list.d/jenkins.list
RUN apt-get update && apt-get install -y curl jenkins

