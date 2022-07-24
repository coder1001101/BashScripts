#!/bin/bash

set -e
my_mac_changer(){
		#clear
		macchanger -l > vendormac.txt
		sudo ifconfig wlan0 down
		ouimac=$(shuf -n 1 vendormac.txt | awk '{print$3}')
		uaamac=$(printf '%02x:%02x:%02x' $[RANDOM%256] $[RANDOM%256] $[RANDOM%256])
		macchanger -m "$ouimac:$uaamac" wlan0
		sudo ifconfig wlan0 up
		sleep 15
}
tor_reload(){
	my_mac_changer
	sudo service tor restart
	my_mac_changer
	sudo service tor restart
	my_mac_changer
	sudo service tor restart
	sleep 15
	proxychains firefox https://check.torproject.org/
	proxychains bash
	
}
while true
do
	wget -q --spider https://google.com
	if [ "$?" -eq 0 ]; then
		echo -e "		\033[1m \e[0;32m Your network connected.\033[0m"
		echo -e "\033[1;40;31m Please wait some settings are changing. \e[0m"
		sudo service tor start
		tor_reload
		
		#nohup bash -u macgen &
		#tail -f nohup.out
		#cd kali-whoami && bash kali-whoami
		#python3 ipchanger.py		
		#sudo kali-whoami --start
	else
		#clear
		echo -e "		\033[1m \e[0;31m Check your network connection.\033[0m"
		sleep 3
	fi
done
