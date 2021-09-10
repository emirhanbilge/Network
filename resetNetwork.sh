#!/bin/bash
echo 1234 | sudo -S su

cp /home/pi/Desktop/EbbScripts/backupNetwork/dhcpcd.conf /etc/dhcpcd.conf
cp /home/pi/Desktop/EbbScripts/backupNetwork/interfaces  /etc/network/interfaces
cp /home/pi/Desktop/EbbScripts/backupNetwork/hostapd.conf /etc/hostapd/hostapd.conf
cp /home/pi/Desktop/EbbScripts/backupNetwork/dnsmasq.conf /etc/dnsmasq.conf