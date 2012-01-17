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
