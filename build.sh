#! /bin/bash

dir=$(cd $(dirname $0) && pwd)
src_dir=${dir}/src
build_dir=${dir}/build

# Compile 
mkdir -p ${build_dir}
nasm -f bin -o ${build_dir}/asmos.bin ${src_dir}/asmos.asm

# Create a blank floppy disk image
dd if=/dev/zero of=${build_dir}/asmos.flp bs=512 count=2880

# Write the bootloader/"kernel" to the floppy disk image
dd conv=notrunc if=${build_dir}/asmos.bin of=${build_dir}/asmos.flp

# To run:
# From floppy image:
# $ qemu-system-i386 -fda build/asmos.flp

# Directly from binary:
# $ qemu-system-i386 build/asmos.bin
