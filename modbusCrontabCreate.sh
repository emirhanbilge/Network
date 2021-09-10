echo 1234 | sudo -S su
sudo echo "cd /home/pi/Desktop/EbbScripts/ModbusScd" >> serverRunner.sh
sudo echo "sudo python3 main.py" >> running.sh
crontab -l > crontab_new2
echo "@reboot /home/pi/Desktop/EbbScripts/Network/running.sh" >> crontab_new2
crontab crontab_new2
rm crontab_new2
sudo chmod +x /home/pi/Desktop/EbbScripts/Network/running.sh


################ Normal webserverimiz için ##################
echo 1234 | sudo -S su

sudo echo "cd /home/pi/Desktop/EbbScripts/Network/WebServer" >> serverRunner.sh
sudo echo "sudo python3 backend.py" >> serverRunner.sh
crontab -l > crontab_new2
echo "@reboot /home/pi/Desktop/EbbScripts/Network/serverRunner.sh" >> crontab_new2
crontab crontab_new2
rm crontab_new2
sudo chmod +x /home/pi/Desktop/EbbScripts/Network/running.sh
###########################################################


sudo reboot

