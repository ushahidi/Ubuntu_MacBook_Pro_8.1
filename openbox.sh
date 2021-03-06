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

# Perform Unattended Install
export DEBIAN_FRONTEND=noninteractive

# Install Packages
apt-get update
apt-get install -y openbox feh gpomme tint2 xfce4-power-manager chromium-browser camorama vidalia xchat gimp vim-gtk lxterminal thunar vlc wireshark zenmap

# Install Skype
wget -O /tmp/skype.deb http://www.skype.com/go/getskype-linux-beta-ubuntu-64
dpkg -i /tmp/skype.deb
apt-get install -fy
rm -f /tmp/skype.deb

# Configure Keyboard Layout
echo 'setxkbmap macintosh_vndr/us' >> /etc/xdg/openbox/autostart

# Two-Finger Tap Perform Right Click
echo 'synclient TapButton2=3' >> /etc/xdg/openbox/autostart

# Disable Three-Finger Tap
echo 'synclient TapButton3=0' >> /etc/xdg/openbox/autostart

# Decrease Touchpad Sensitivity
echo 'synclient FingerHigh=100' >> /etc/xdg/openbox/autostart

# Enable Two-Finger Vertical Scrolling
echo 'synclient VertTwoFingerScroll=1' >> /etc/xdg/openbox/autostart

# Enable Two-Finger Horizontal Scrolling
echo 'synclient HorizTwoFingerScroll=1' >> /etc/xdg/openbox/autostart

# Display the Desktop Wallpaper
wget -O ~/wallpaper.jpg http://i.imgur.com/nBctT.jpg
echo "feh --bg-max $HOME/wallpaper.jpg" >> /etc/xdg/openbox/autostart

# Visual Display for Apple Hotkeys
echo 'gpomme &' >> /etc/xdg/openbox/autostart

# Taskbar
echo 'tint2 &' >> /etc/xdg/openbox/autostart

# Power Manager Applet
echo 'xfce4-power-manager' >> /etc/xdg/openbox/autostart

# Disable Multiple Desktops
sed -i '/<number>/c<number>1</number>' /etc/xdg/openbox/rc.xml

# Display Openbox Menu on Right Click in Taskbar
sed -i '/wm_menu = 0/cwm_menu = 1' /etc/xdg/tint2/tint2rc

# Install Customised Menu
wget -O /etc/xdg/openbox/menu.xml https://raw.github.com/ushahidi/Ubuntu_MacBook_Pro_8.1/master/menu.xml
