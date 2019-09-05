# bare-bone-operating-system
This repository is intended to build a bare-bone operating system from scrath
following the book [Writing a Simple Operating System —from Scratch](https://www.cs.bham.ac.uk/~exr/lectures/opsys/10_11/lectures/os-dev.pdf) by Nick Blundell.
## Setup
```bash
# build docker image for development environment.
docker build -t os-env .

# Or build on top of the base image, which is built on master automatically,
# from docker hub. In this way, the build can be speeded up due to caching.
docker pull ghlghhh/os-env:base
docker build --cache-from=ghlghhh/os-env:base -t os-env .

# Running 'qemu' will create GUI for emulation. The "run_container.sh" performs
# setup so that the container can be run with video output and run the default
# image, ghlghhh/os-env:base, if no image is provided.
# By default the source directory, `pwd`/src, is mounted to /workspace/src in
# the container, the user can modify the run script to fit the user's need.
./run_container.sh [optional-image]

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
Read the binary file in hexadecimal format
```bash
od -t x1 -A n target/boot_sector.bin
```