#!/bin/bash

wget -cO /tmp/ubuntu-11.10-desktop-amd64.iso http://nl.releases.ubuntu.com/releases/11.10/ubuntu-11.10-desktop-amd64.iso

umount $1
mkfs.vfat -I $1

mkdir /tmp/{iso,usb}
mount -o loop /tmp/ubuntu-11.10-desktop-amd64.iso /tmp/iso
mount $1 /tmp/usb

rsync -a /tmp/iso/ /tmp/usb/

mv /tmp/usb/isolinux /tmp/usb/syslinux
mv /tmp/usb/syslinux/isolinux.cfg /tmp/usb/syslinux/syslinux.cfg

sed -i 's/quiet splash/quiet splash nomodeset/g' /tmp/usb/boot/grub/loopback.cfg
sed -i 's/quiet splash/quiet splash nomodeset/g' /tmp/usb/syslinux/txt.cfg

mkdir /tmp/usb/wireless
wget -O /tmp/usb/wireless/compat-wireless-2.6.tar.bz2 http://linuxwireless.org/download/compat-wireless-2.6/compat-wireless-2.6.tar.bz2
wget -O /tmp/usb/wireless/b43-fwcutter-015.tar.bz2 http://bu3sch.de/b43/fwcutter/b43-fwcutter-015.tar.bz2
wget -O /tmp/usb/wireless/broadcom-wl-5.100.138.tar.bz2 http://www.lwfinger.com/b43-firmware/broadcom-wl-5.100.138.tar.bz2

umount /tmp/iso $1
rmdir /tmp/{iso,usb}
rm /tmp/ubuntu-11.10-desktop-amd64.iso

syslinux $1
