#!/bin/bash

########################### First Setupın Crontaba Eklenmesi ##########################
echo 1234 | sudo -S su
sudo crontab -l > crontab_new5
sudo echo "@reboot /home/pi/Desktop/EbbScripts/Network/FirstSetup/startSetup.sh" > crontab_new5
sudo crontab crontab_new5
sudo rm crontab_new5
sudo chmod +x /home/pi/Desktop/EbbScripts/Network/FirstSetup/startSetup.sh
##############################################################################################




################################### Hotspotun Kurulması #####################################
sudo apt-get -y install hostapd dnsmasq
echo denyinterfaces wlan0 >> /etc/dhcpcd.conf
#loopback interface settings
echo "auto lo" >> /etc/network/interfaces
echo "iface lo inet loopback"
#eth0 settings option 1
#Uncomment next two lines to get available IP from local network
#auto eth0
#iface eth0 inet dhcp
#eth0 settings option 2
#Uncomment next five lines to get static IP from local network
echo "auto eth0" >> /etc/network/interfaces
echo "iface eth0 inet static" >> /etc/network/interfaces
echo "   address 192.168.0.69" >> /etc/network/interfaces
echo "   netmask 255.255.255.0" >> /etc/network/interfaces
echo "   gateway 192.168.0.254" >> /etc/network/interfaces

#Hotspot interface settings
echo "allow-hotplug wlan0" >> /etc/network/interfaces
echo "iface wlan0 inet static" >> /etc/network/interfaces
echo "   address 192.168.15.1" >> /etc/network/interfaces
echo "   netmask 255.255.255.0" >> /etc/network/interfaces
echo "   network 192.168.15.0" >> /etc/network/interfaces
echo "   broadcast 192.168.15.255" >> /etc/network/interfaces
echo "interface=wlan0" >> /etc/hostapd/hostapd.conf
echo "hw_mode=g" >> /etc/hostapd/hostapd.conf
echo "channel=7" >> /etc/hostapd/hostapd.conf
echo "wmm_enabled=1" >> /etc/hostapd/hostapd.conf
echo "macaddr_acl=0" >> /etc/hostapd/hostapd.conf
echo "auth_algs=1" >> /etc/hostapd/hostapd.conf
echo "ignore_broadcast_ssid=0" >> /etc/hostapd/hostapd.conf
echo "wpa=2" >> /etc/hostapd/hostapd.conf
echo "wpa_key_mgmt=WPA-PSK" >> /etc/hostapd/hostapd.conf
echo "wpa_pairwise=TKIP" >> /etc/hostapd/hostapd.conf
echo "rsn_pairwise=CCMP" >> /etc/hostapd/hostapd.conf
echo "ssid=Rpi-Hotspot" >> /etc/hostapd/hostapd.conf
echo "wpa_passphrase=password" >> /etc/hostapd/hostapd.conf
echo 'DAEMON_CONF="/etc/hostapd/hostapd.conf"' >> /etc/default/hostapd
#sudo mv /etc/dnsmasq.conf /etc/dnsmasq.conf.bak
echo "interface=wlan0" >> /etc/dnsmasq.conf
echo "listen-address=192.168.15.1" >> /etc/dnsmasq.conf
echo "bind-interfaces" >> /etc/dnsmasq.conf
echo "server=8.8.8.8" >> /etc/dnsmasq.conf
echo "domain-needed" >> /etc/dnsmasq.conf
echo "bogus-priv" >> /etc/dnsmasq.conf
echo "dhcp-range=192.168.15.2,192.168.15.100,24h" >> /etc/dnsmasq.conf
sudo systemctl unmask hostapd
sudo reboot
##############################################################################################

