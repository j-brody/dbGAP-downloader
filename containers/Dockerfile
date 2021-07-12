FROM ubuntu:20.04

RUN apt-get update && apt-get install -y wget
ARG USER=aspera
ARG UID=1000
ARG GID=1000
# default password for user

ARG PW=aspera# Option1: Using unencrypted password/ specifying password
RUN useradd -m ${USER} --uid=${UID} && echo "${USER}:${PW}" | \
      chpasswd

USER ${UID}:${GID}
WORKDIR /home/${USER}

RUN wget http://download.asperasoft.com/download/sw/connect/3.6.2/aspera-connect-3.6.2.117442-linux-64.tar.gz
RUN wget http://download.asperasoft.com/download/sw/ascp-client/3.5.4/ascp-install-3.5.4.102989-linux-64.sh
RUN wget "ftp://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/current/sratoolkit.current-centos_linux64.tar.gz"

RUN tar -xvf aspera-connect-3.6.2.117442-linux-64.tar.gz
RUN ./aspera-connect-3.6.2.117442-linux-64.sh
RUN tar -xzf sratoolkit.current-centos_linux64.tar.gz
