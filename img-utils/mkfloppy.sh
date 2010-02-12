#!/bin/sh


[ -z $3 ] && echo "Usage: $0 image kernel empty-image" && exit 1

IMAGE=$1
KERNEL=$2
EMPTYIMAGE=$3

cp $EMPTYIMAGE $IMAGE

mcopy -i $IMAGE - ::boot/grub/menu.lst <<EOF
title Kernel: $(basename $KERNEL)
root (fd0)
kernel /$(basename $KERNEL)
EOF

echo 'Adding kernel'
mcopy -i $IMAGE $KERNEL ::/

echo 'Rootfs done'
