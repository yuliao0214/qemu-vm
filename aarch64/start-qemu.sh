#!/bin/sh
#root

if [ $# -eq 1 ] && [ $1 = "debug" ]
then
    debug="-S -s"
fi

qemu-system-aarch64 -M virt -cpu cortex-a53 -nographic -smp 4 -m 2G -kernel Image \
    -append "rootwait root=/dev/vda console=ttyAMA0" \
    -netdev user,id=eth0,hostfwd=tcp::17777-:22 -device virtio-net-device,netdev=eth0 \
    -drive file=rootfs.ext4,if=none,format=raw,id=hd0 -device virtio-blk-device,drive=hd0 \
    -fsdev local,id=test_dev,path=shared,security_model=none -device virtio-9p-pci,fsdev=test_dev,mount_tag=test_mount $debug

