# http://www.ubuntubuzz.com/2011/10/macbook-pro-wireless-broadcom-bcm4331.html
modprobe b43
cp /etc/modules /etc/modules.old
echo "b43" | sudo tee -a /etc/modules 
cp /etc/pm/config.d/default /etc/pm/config.d/default.old
echo 'SUSPEND_MODULES="b43"' >> /etc/pm/config.d/default
