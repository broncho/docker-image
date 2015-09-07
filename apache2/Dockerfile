FROM ubuntu:14.04
MAINTAINER secondriver  <secondriver@yeah.net>

ENV REFERSHED_AT 2015-09-07

RUN apt-get -y update
RUN apt-get -y install apache2

VALUME ["/var/www"]
WORKDIR /var/www

ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid
ENV APACHE_RUN_DIR /var/run/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2

RUN mkdir -p $APACHE_RUN_DIR $APACHE_LOCK_DIR $APACHE_LOG_DIR

EXPOSE 80

ENTRYPOINT ["/usr/sbin/apache2"]
CMD ["-D", "FOREGROUND"]
