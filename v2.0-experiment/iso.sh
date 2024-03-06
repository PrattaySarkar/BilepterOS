#!/bin/sh
set -e
. ./build.sh

mkdir -p isodir
mkdir -p isodir/boot
mkdir -p isodir/boot/grub

cp sysroot/boot/myos.kernel isodir/boot/bilepteros2.kernel
cat > isodir/boot/grub/grub.cfg << EOF
menuentry "BilepterOS v2.0" {
	multiboot /boot/bilepteros2.kernel
}
EOF
grub-mkrescue -o bilepteros2.iso isodir
