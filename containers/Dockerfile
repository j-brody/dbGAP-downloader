FROM ubuntu:20.04
RUN apt-get update
RUN apt-get install -y wget
RUN wget http://download.asperasoft.com/download/sw/connect/3.6.2/aspera-connect-3.6.2.117442-linux-64.tar.gz -o aspconnect.log && \
tar -xvf aspera-connect-3.6.2.117442-linux-64.tar.gz
ARG USER=aspera
ARG UID=1000
ARG GID=1000
ARG PW=docker

RUN useradd -m ${USER} --uid=${UID} && echo "${USER}:${PW}" | \
      chpasswd
USER aspera
RUN ./aspera-connect-3.6.2.117442-linux-64.sh