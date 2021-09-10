echo 1234 | sudo -S su
sudo echo "sudo python3 main.py" > running.sh
sudo crontab -l > crontab_new2
sudo echo "@reboot /home/pi/EbbScripts/Network/running.sh" >> crontab_new2
sudo crontab crontab_new2
sudo rm crontab_new2
sudo chmod +x /home/pi/Desktop/EbbScripts/Network/running.sh
sudo reboot