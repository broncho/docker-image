FROM ubuntu:14.04
MAINTAINER secondriver  <secondriver@yeah.net>
ENV REFERSHED_AT 2015-09-07

ENV NODE_VERSION node-v0.12.7-linux-x64
ENV NODE_HOME  /usr/local/nodejs
ENV PATH=$NODE_HOME/bin:$PATH

WORKDIR /usr/local

RUN apt-get install -y wget && \
    wget  https://nodejs.org/dist/latest/${NODE_VERSION}.tar.gz && \
    tar zxvf ${NODE_VERSION}.tar.gz && \
    ln -s /usr/local/${NODE_VERSION} ${NODE_HOME} && \
    rm -rf ${NODE_VERSION}.tar.gz

WORKDIR ~/nodejs

EXPOSE 8080 

CMD node