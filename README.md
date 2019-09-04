# bare-bone-operating-system
This repository is intended to build a bare-bone operating system from scrath
following the book [Writing a Simple Operating System —from Scratch](https://www.cs.bham.ac.uk/~exr/lectures/opsys/10_11/lectures/os-dev.pdf) by Nick Blundell.
## Setup
```bash
# build docker image for development environment
docker build --build-arg UID=`id -u` --build-arg GID=`id -g` -t os-env .

# Or build on top of the base image, which is built on master automatically,
# from docker hub. In this way, the build can be speeded up due to caching.
docker pull ghlghhh/os-env:base
docker build --cache-from=ghlghhh/os-env:base --build-arg UID=`id -u` --build-arg GID=`id -g` -t os-env .

# run docker image interactively with video display connected
docker run -it --rm -e DISPLAY -v $HOME/.Xauthority:/home/dev/.Xauthority --net=host os-env

# add the following argument to mount source files in host machine to container
# -v`pwd`/src:/workspace/src
```
## First step
Generate binary file of the boot sector
```bash
nasm -f bin -o target/boot_sector.bin src/simple_boot_sector.asm
```
Run emulator with the binary file as boot disk image
```bash
qemu-system-x86_64 target/boot_sector.bin
```