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

apt-get update
apt-get install -y openbox feh gpomme tint2 xfce4-power-manager

echo 'setxkbmap macintosh_vndr/us' >> /etc/xdg/openbox/autostart
echo 'feh --bg-max /home/user/wallpaper.jpg &' >> /etc/xdg/openbox/autostart
echo 'gpomme &' >> /etc/xdg/openbox/autostart
echo 'tint2 &' >> /etc/xdg/openbox/autostart
echo 'xfce4-power-manager &' >> /etc/xdg/openbox/autostart

sed -i '/<number>/c<number>1</number>' /etc/xdg/openbox/rc.xml

sed -i '/EndSection/iOption "TabButton2" "3"' /usr/share/X11/xorg.conf.d/50-synaptics.conf
sed -i '/EndSection/iOption "TabButton3" "0"' /usr/share/X11/xorg.conf.d/50-synaptics.conf
sed -i '/EndSection/iOption "FingerHigh" "80"' /usr/share/X11/xorg.conf.d/50-synaptics.conf

synclient TapButton2=3
synclient TapButton3=0
synclient FingerHigh=80