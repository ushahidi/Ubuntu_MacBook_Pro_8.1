#!/bin/bash

umount $2
mkfs.vfat -I $2

mkdir /tmp/{iso,usb}
mount -o loop $1 /tmp/iso
mount $2 /tmp/usb

rsync -a /tmp/iso/ /tmp/usb/

mv /tmp/usb/isolinux /tmp/usb/syslinux
mv /tmp/usb/syslinux/isolinux.cfg /tmp/usb/syslinux/syslinux.cfg

sed -i 's/quiet splash/quiet splash nomodeset/g' /tmp/usb/boot/grub/loopback.cfg
sed -i 's/quiet splash/quiet splash nomodeset/g' /tmp/usb/syslinux/txt.cfg

umount /tmp/iso $2
rm /tmp/{iso,usb}

syslinux $2
