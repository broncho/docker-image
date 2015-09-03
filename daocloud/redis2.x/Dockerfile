FROM daocloud.io/secondriver/base-os:master-init

MAINTAINER secondriver <secondriver@yeah.net>

RUN echo 'Redis 2.x version' && \
    cd /tmp && \
    wget -O  redis-2.8.21.tar.gz https://github.com/antirez/redis/archive/2.8.21.tar.gz && \
    tar xvzf redis-2.8.21.tar.gz && \
    cd redis-2.8.21 && \
    make && \
    cp -f src/redis-sentinel /usr/local/bin && \
    cp -f src/redis-server /usr/local/bin  && \
    cp -f src/redis-cli  /usr/local/bin && \
    cp -f src/redis-check-dump  /usr/local/bin && \
    cp -f src/redis-check-aof  /usr/local/bin && \
    cp -f src/redis-benchmark  /usr/local/bin && \
    mkdir -p /etc/redis && \
    cp -f *.conf  /etc/redis && \
    rm -rf /tmp/redis-2.8.21 && \
    sed -i 's/^\(bind .*\)$/# \1/' /etc/redis/redis.conf && \
    sed -i 's/^\(daemonize .*\)$/# \1/' /etc/redis/redis.conf && \
    sed -i 's/^\(dir .*\)$/# \1\ndir \/data/' /etc/redis/redis.conf && \
    sed -i 's/^\(logfile .*\)$/# \1/' /etc/redis/redis.conf

ENV REDIS_DATA  /data

VOLUME ${REDIS_DATA}

WORKDIR ${REDIS_DATA}

EXPOSE 6379

CMD ["redis-server", "/etc/redis/redis.conf"]