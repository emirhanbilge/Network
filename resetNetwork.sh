#!/bin/bash
echo 1234 | sudo -S su

cp /home/pi/Desktop/EbbScripts/backupNetwork /etc/dhcpcd.conf
cp /home/pi/Desktop/EbbScripts/backupNetwork  /etc/network/interfaces
cp /home/pi/Desktop/EbbScripts/backupNetwork /etc/hostapd/hostapd.conf
cp /home/pi/Desktop/EbbScripts/backupNetwork /etc/dnsmasq.conf