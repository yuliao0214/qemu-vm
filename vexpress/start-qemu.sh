#!/bin/sh
qemu-system-arm -M vexpress-a9 -smp 1 -m 256 \
    -kernel zImage -dtb vexpress-v2p-ca9.dtb \
    -drive file=rootfs.ext2,if=sd,format=raw \
    -append "root=/dev/mmcblk0  console=ttyAMA0 earlyprintk" \
    -net nic,model=lan9118 -net user \
    -nographic
