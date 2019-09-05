FROM ubuntu:18.04 AS dev-env

WORKDIR /workspace
RUN apt-get update && apt-get install -y qemu nasm

# copy the source files into docker image
# and create empty target directory to store build artifacts
COPY src /workspace/src
RUN mkdir -p /workspace/target
