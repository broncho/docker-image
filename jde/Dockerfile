FROM secondriver/jde:v1.0.1

LABEL maintainer="secondriver@yeah.net" \
      version="1.2.0" \
      descript="Java develop environment, includes git maven jdk8 "


RUN /usr/bin/git config --global --unset user.name 
RUN /usr/bin/git config --global --unset user.email
RUN  mkdir -p /opt/dev

WORKDIR /opt/dev
    
CMD ["/bin/bash"]
