modprobe b43
echo b43 >> /etc/modules 
echo 'SUSPEND_MODULES="b43"' >> /etc/pm/config.d/default
