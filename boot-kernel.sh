#!/bin/bash
source constant.sh

KERNEL=$1
$qemubin -smp $cores -m $mem -cpu $cpu -enable-kvm \
	-drive file="$workdir/qemu-disk.ext4,if=ide,format=raw" \
	-kernel $KERNEL -nographic -no-reboot \
	-append "nokaslr panic=-1 console=ttyS0 root=/dev/sda rw init=$2"
