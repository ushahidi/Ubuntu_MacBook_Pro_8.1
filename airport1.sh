apt-get install build-essential automake make
wget -c http://wireless.kernel.org/download/compat-wireless-2.6/compat-wireless-2011-08-27.tar.bz2
wget -c -O patch_bcm4331.tar.bz2 http://ubuntuone.com/4Z8eqdGF1jcooqUoY4IsPN
tar xf compat-wireless-2011-08-27.tar.bz2
tar xf patch_bcm4331.tar.bz2
cd compat-wireless-2011-08-27/
patch -p1 < ../bcm4331-1.patch
patch -p1 < ../bcm4331-2.patch
patch -p1 < ../bcm4331-3.patch
scripts/driver-select b43
sed -i '/# CONFIG_B43_PHY_HT=y/cCONFIG_B43_PHY_HT=y' config.mk
make
make install
cd ..
wget -c http://bu3sch.de/b43/fwcutter/b43-fwcutter-015.tar.bz2
wget -c http://www.lwfinger.com/b43-firmware/broadcom-wl-5.100.138.tar.bz2
tar xf b43-fwcutter-015.tar.bz2
cd b43-fwcutter-015
make
tar xf ../broadcom-wl-5.100.138.tar.bz2
export FIRMWARE_INSTALL_DIR="/lib/firmware"
./b43-fwcutter -w "$FIRMWARE_INSTALL_DIR"  broadcom-wl-5.100.138/linux/wl_apsta.o
cd compat-wireless-2011-08-27
make wlunload
