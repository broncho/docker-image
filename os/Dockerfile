FROM ubuntu:14.04
RUN echo Hello Ubuntu 14.04 && apt-get install -y wget
# Install Java.

ENV ORALCE_JDK_VERSION 8
ENV ORACLE_JDK_U u60
ENV ORACLE_JDK_B b27
ENV JAVA_HOME /opt/jdk
ENV JDK_DIR /opt/jdk1.8.0_60

WORKDIR /opt

RUN echo "--header='Cookie:oraclelicense=accept-securebackup-cookie' \
    http://download.oracle.com/otn-pub/java/jdk/${ORALCE_JDK_VERSION}${ORALCE_JDK_U}-${ORACLE_JDK_B}/jdk-${ORALCE_JDK_VERSION}-linux-x64.tar.gz \
    -o jdk.tar.gz " | wget 
RUN tar zxvf jdk.tar.gz &&  ln -s ${JDK_DIR} ${JAVA_HOME}

# Define commonly used JAVA_HOME variable

ENV JRE_HOME ${JAVA_HOME}

RUN ${JAVA_HOME}/bin/java -version

# Define working directory.
WORKDIR /app

# Define default command.
CMD ["bash"]