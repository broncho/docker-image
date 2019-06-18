FROM maven:3.3.3

ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH
RUN mkdir -p "$CATALINA_HOME"
WORKDIR $CATALINA_HOME

ENV TOMCAT_FILE=apache-tomcat-8.5.42.tar.gz
ENV TOMCAT_TGZ_URL http://mirrors.tuna.tsinghua.edu.cn/apache/tomcat/tomcat-8/v8.5.42/bin/apache-tomcat-8.5.42.tar.gz
ENV TOMCAT_TGZ_SHA https://www.apache.org/dist/tomcat/tomcat-8/v8.5.42/bin/apache-tomcat-8.5.42.tar.gz.sha512

RUN set -x \
    && curl -fSL "$TOMCAT_TGZ_URL" -o "$TOMCAT_FILE" \
    && curl -fSL "$TOMCAT_TGZ_SHA" -o "$TOMCAT_FILE.sha512" \
    && sha512sum -c "$TOMCAT_FILE.sha512" \
    && tar -xvf "$TOMCAT_FILE" --strip-components=1 \
    && rm bin/*.bat \
    && rm "$TOMCAT_FILE"*

EXPOSE 8080
CMD ["catalina.sh", "run"] 
