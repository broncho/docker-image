FROM ubuntu:14.04
MAINAINER secondriver <secondriver@yeah.net>

RUN echo '"java-dev-base"' image && apt-get install -y wget

ENV ORALCE_JDK_VERSION 8
ENV ORACLE_JDK_U u60
ENV ORACLE_JDK_B b27
ENV JAVA_HOME /opt/jdk
ENV JRE_HOME ${JAVA_HOME}
ENV JDK_DIR /opt/jdk1.8.0_60
ENV JDK_GZ  jdk-${ORALCE_JDK_VERSION}${ORACLE_JDK_U}-linux-x64.tar.gz
ENV DOWN_URL http://download.oracle.com/otn-pub/java/jdk/${ORALCE_JDK_VERSION}${ORACLE_JDK_U}-${ORACLE_JDK_B}/${JDK_GZ}

WORKDIR /opt

# Install Java.
RUN wget --header='Cookie:oraclelicense=accept-securebackup-cookie' ${DOWN_URL}
RUN tar zxvf ${JDK_GZ}  && ln -s ${JDK_DIR} ${JAVA_HOME} && rm ${JDK_GZ}

# Define working directory.
WORKDIR /app

# Define default command.
CMD ${JAVA_HOME}/bin/java -version