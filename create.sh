#!/bin/bash

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

# Download Ubuntu ISO
wget -cO /tmp/ubuntu-11.10-desktop-amd64.iso http://nl.releases.ubuntu.com/releases/11.10/ubuntu-11.10-desktop-amd64.iso

# Unmount USB Flash Drive
umount $1

# Format USB Flash Drive to FAT32
mkfs.vfat -I $1

# Mount Ubuntu ISO and USB Flash Drive
mkdir /tmp/{iso,usb}
mount -o loop /tmp/ubuntu-11.10-desktop-amd64.iso /tmp/iso
mount $1 /tmp/usb

# Copy Files from Ubuntu ISO to USB Flash Drive
rsync -a /tmp/iso/ /tmp/usb/

# Use ISOLINUX Configuration as SYSLINUX Configuration
mv /tmp/usb/isolinux /tmp/usb/syslinux
mv /tmp/usb/syslinux/isolinux.cfg /tmp/usb/syslinux/syslinux.cfg

# Download Wireless Drivers and Scripts to USB Flash Drive for Offline Installation
mkdir /tmp/usb/wireless
wget -O /tmp/usb/wireless/compat-wireless-2.6.tar.bz2 http://linuxwireless.org/download/compat-wireless-2.6/compat-wireless-2.6.tar.bz2
wget -O /tmp/usb/wireless/b43-fwcutter-015.tar.bz2 http://bu3sch.de/b43/fwcutter/b43-fwcutter-015.tar.bz2
wget -O /tmp/usb/wireless/broadcom-wl-5.100.138.tar.bz2 http://www.lwfinger.com/b43-firmware/broadcom-wl-5.100.138.tar.bz2
wget -O /tmp/usb/wireless/wireless.sh https://raw.github.com/ushahidi/Ubuntu_MacBook_Pro_8.1/master/wireless.sh

# Unmount Ubuntu ISO and USB Flash Drive
umount /tmp/iso $1
rmdir /tmp/{iso,usb}

# Delete Ubuntu ISO
rm /tmp/ubuntu-11.10-desktop-amd64.iso

# Install SYSLINUX Bootloader on USB Flash Drive
syslinux $1
