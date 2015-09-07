FROM ubuntu:14:04
MAINTAINER secondriver  <secondriver@yeah.net>
ENV REFERSHED_AT 2015-09-07

ENV NODE_VERSION 0.12

RUN apt-get update && \
    apt-get install -y wget && \
    wget -qO- https://raw.github.com/creationix/nvm/master/install.sh | sh
 
RUN nvm install $NODE_VERSION
RUN npm install -g hexo-cli

VALUME /usr/local/hexo
WORKDIR /usr/local/hexo

ENTRYPOINT hexo server -p 4000

EXPOSE 4000