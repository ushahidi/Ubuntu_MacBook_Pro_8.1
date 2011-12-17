# Ubuntu 11.10 on the MacBook Pro 8.1

1. Create the USB flash drive as follows on an existing Ubuntu machine which is connected to the internet:

    wget -O /tmp/create.sh https://raw.github.com/ushahidi/Ubuntu_MacBook_Pro_8.1/master/create.sh
    sudo bash /tmp/create.sh /dev/sdb
    rm /tmp/create.sh

2. Insert the USB flash drive into your MacBook Pro. Reboot, hold down the option key right after the bootup sound and select the flash drive.
3. Install as usual but remember to select the Macintosh keyboard layout when prompted during the installation.
4. Boot into your new installation and execute the following at the terminal:

    sudo umount /dev/sdb
    mkdir /tmp/usb
    sudo mount /dev/sdb /tmp/usb
    sudo bash /tmp/usb/wireless/wireless.sh

5. Your system will reboot and then you should be able to use the wireless as usual.
