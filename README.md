# Ubuntu 11.10 on the MacBook Pro 8.1

## Installation

Note: If you have multiple internal or external drives connected, your device name might be different than `/dev/sdb`. If this is the case, please make the necessary adjustments to the commands below.

1. Create the USB flash drive by executing the following at a terminal on an existing Ubuntu machine which is connected to the internet:  
`wget -qO- https://raw.github.com/ushahidi/Ubuntu_MacBook_Pro_8.1/master/create.sh | sudo bash`
2. Insert the USB flash drive into your MacBook Pro. Reboot, hold down the option key right after the bootup sound and select the flash drive.
3. Install as usual but remember to select the Macintosh keyboard layout when prompted during the installation.
4. Boot into your new installation.
5. Copy the directory named `wireless` from the USB flash drive to some other location (`/tmp` is great).
6. Open the terminal, change to this directory and execute the `wireless.sh` script.  
`cd /tmp/wireless`  
`bash wireless.sh`
5. You can now delete the copied directory and reboot your system for the changes to take effect.

## Openbox

If you prefer to run Openbox, here is one possible configuration you are welcome to use.

    wget -qO- https://raw.github.com/ushahidi/Ubuntu_MacBook_Pro_8.1/master/openbox.sh | sudo bash

## Licensing

* [GNU General Public License](http://www.gnu.org/copyleft/gpl.html)

## Support

* [SwiftRiver Google Group](http://groups.google.com/group/swiftriver)

## See Also

* [MacBook Pro](http://en.wikipedia.org/wiki/MacBook_Pro)
* [Ubuntu](http://www.ubuntu.com/)
* [Ushahidi.com](http://www.ushahidi.com/)
