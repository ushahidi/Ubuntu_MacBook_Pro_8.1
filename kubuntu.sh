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
apt-get install -y kubuntu-desktop pommed

# Configure Touchpad
echo '#!/bin/bash' >> ~/.kde/Autostart/synclient.sh
echo 'synclient TapButton2=3' >> ~/.kde/Autostart/synclient.sh
echo 'synclient TapButton3=2' >> ~/.kde/Autostart/synclient.sh
chown +x ~/.kde/Autostart/synclient.sh
