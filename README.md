# Ubuntu 11.10 on the MacBook Pro 8.1

## Installation

1. Insert a 2GB (or larger) USB flash drive into an existing Ubuntu machine, which is connected to the internet. Note that all the contents of this drive will be erased.
2. Execute the following at the terminal:  
``sudo bash -c "`wget -qO- https://raw.github.com/ushahidi/Ubuntu_MacBook_Pro_8.1/master/create.sh`"``
3. Take the USB flash drive out and insert it into your Macbook Pro.
4. Reboot, hold down the option key right after the bootup sound and select the flash drive.
5. Install as usual but remember to select the Macintosh keyboard layout when prompted during the installation.
6. Boot into your new installation.
7. Copy the directory named `wireless` from the USB flash drive to some other location (`/tmp` is great).
8. Open the terminal, change to this directory and execute the `wireless.sh` script. For example:  
`cd /tmp/wireless`  
`sudo bash wireless.sh`  
9. You can now delete the copied directory and reboot your system for the changes to take effect.

## Openbox

![Screenshot](http://i.imgur.com/mNODR.jpg)

If you prefer to run Openbox, here is one possible configuration you are welcome to use.

    wget -qO- https://raw.github.com/ushahidi/Ubuntu_MacBook_Pro_8.1/master/openbox.sh | sudo bash

## Licensing

* [GNU General Public License](http://www.gnu.org/copyleft/gpl.html)

## Support

* [SwiftRiver Google Group](http://groups.google.com/group/swiftriver)

## See Also

* [MacBook Pro](http://en.wikipedia.org/wiki/MacBook_Pro)
* [Ubuntu](http://www.ubuntu.com/)
* [Ushahidi](http://www.ushahidi.com/)
