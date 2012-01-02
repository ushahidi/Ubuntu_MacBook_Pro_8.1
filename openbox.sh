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

# Install Packages
apt-get update
apt-get install -y openbox feh gpomme tint2 xfce4-power-manager

# Configure Keyboard Layout
echo 'setxkbmap macintosh_vndr/us' >> /etc/xdg/openbox/autostart

# Two-Finger Tap Perform Right Click
echo 'synclient TapButton2=3' >> /etc/xdg/openbox/autostart

# Disable Three-Finger Tap
echo 'synclient TapButton3=0' >> /etc/xdg/openbox/autostart

# Decrease Touchpad Sensitivity
echo 'synclient FingerHigh=80' >> /etc/xdg/openbox/autostart

# Display the Desktop Wallpaper
echo 'feh --bg-max /home/user/wallpaper.jpg &' >> /etc/xdg/openbox/autostart

# Visual Display for Apple Hotkeys
echo 'gpomme &' >> /etc/xdg/openbox/autostart

# Taskbar
echo 'tint2 &' >> /etc/xdg/openbox/autostart

# Power Manager Applet
echo 'xfce4-power-manager &' >> /etc/xdg/openbox/autostart

# Disable Multiple Desktops
sed -i '/<number>/c<number>1</number>' /etc/xdg/openbox/rc.xml

# Display Openbox Menu on Right Click in Taskbar
sed -i '/wm_menu = 0/cwm_menu = 1' /etc/xdg/tint2/tint2rc