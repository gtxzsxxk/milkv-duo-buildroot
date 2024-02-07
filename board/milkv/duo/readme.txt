Milk-V Duo (https://milkv.io/docs/duo/overview)

Intro
=====

Milk-V Duo is an ultra-compact embedded development platform
based on the rv64 CV1800B chip. It can run Linux and RTOS,
providing a reliable, cost-effective, and high-performance
platform for professionals, industrial ODMs, AIoT enthusiasts,
DIY enthusiasts, and creators.

How to build it
===============

Configure Buildroot:

    $ make milkv_duo_musl_riscv64_defconfig

The milkv_duo_musl_riscv64_defconfig will by default provide
the full 64MiB free RAM. If you want to build with memory
reserved for ION (generalized memory manager in linux, i.e.
some memory will be reserved for the camera algorithms), please try:

    $ make milkv_duo_musl_riscv64_ion_defconfig

For more information about the ION, please refer to

https://github.com/milkv-duo/duo-buildroot-sdk/blob/develop/README.md?plain=1#L436

Modify configuration if needed, e.g. add more packages to target:

    $ make menuconfig

Compile everything and build the SD card image:

    $ make

How to write the SD card
========================

Once the build process is finished you will have an image
called "sdcard.img" in the output/images/ directory.

Copy the bootable "sdcard.img" onto an SD card with "dd":

  $ sudo dd if=output/images/sdcard.img of=/dev/sdX
