#!/bin/bash

tar xjf compat-wireless-2.6.tar.bz2
cd compat-wireless-*
scripts/driver-select b43
make
make install
cd ..
tar xjf b43-fwcutter-015.tar.bz2
cd b43-fwcutter-015
make
tar xjf ../broadcom-wl-5.100.138.tar.bz2
export FIRMWARE_INSTALL_DIR="/lib/firmware"
./b43-fwcutter -w "$FIRMWARE_INSTALL_DIR"  broadcom-wl-5.100.138/linux/wl_apsta.o
cd ../compat-wireless-*
make wlunload
echo b43 >> /etc/modules
echo 'SUSPEND_MODULES="b43"' >> /etc/pm/config.d/default
