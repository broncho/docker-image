FROM ubuntu:14.04

RUN echo Hello Ubuntu 14.04 && apt-get install -y wget

# Install Java.

ENV ORALCE_JDK_VERSION 8
ENV ORACLE_JDK_U u60
ENV ORACLE_JDK_B b27
ENV JAVA_HOME /opt/jdk
ENV JRE_HOME ${JAVA_HOME}
ENV JDK_DIR /opt/jdk1.8.0_60
ENV DOWN_URL http://download.oracle.com/otn-pub/java/jdk/${ORALCE_JDK_VERSION}${ORACLE_JDK_U}-${ORACLE_JDK_B}/jdk-${ORALCE_JDK_VERSION}-linux-x64.tar.gz

WORKDIR /opt

RUN wget --header='Cookie:oraclelicense=accept-securebackup-cookie' ${DOWN_URL}   
     
RUN tar zxvf jdk-${ORALCE_JDK_VERSION}-linux-x64.tar.gz &&  ln -s ${JDK_DIR} ${JAVA_HOME} && rm jdk-${ORALCE_JDK_VERSION}-linux-x64.tar.gz

RUN ${JAVA_HOME}/bin/java -version

# Define working directory.
WORKDIR /app

# Define default command.
CMD ${JAVA_HOME}/bin/java -version