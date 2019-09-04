FROM ubuntu:18.04 AS dev-env

WORKDIR /workspace
RUN apt-get update && apt-get install -y qemu nasm

# copy the source files into docker image
# and create empty target directory to store build artifacts
COPY src /workspace/src
RUN mkdir -p /workspace/target

# Running 'qemu' will create GUI for emulation. The following instructions
# create an user in docker image with the same UID and GID as host machine user,
# so that the docker image can be run with video output.
#
# Ref: http://fabiorehm.com/blog/2014/09/11/running-gui-apps-with-docker/

# If host machine user has different UID and/or GID, they should be set
# accordingly with '--build-arg UID=`id -u`' and/or '--build-arg UID=`id -g`'
ARG UID=1000
ARG GID=1000

RUN mkdir -p /home/dev && \
    echo "dev:x:${UID}:${GID}:dev,,,:/home/dev:/bin/bash" >> /etc/passwd && \
    echo "dev:x:${GID}}:" >> /etc/group && \
    chown ${UID}:${GID} -R /home/dev && \
    chown ${UID}:${GID} -R /workspace

USER dev