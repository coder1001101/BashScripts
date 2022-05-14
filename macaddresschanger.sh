#!/bin/bash
echo ================================================================================
figlet "        CMP-Solution"
echo ================================================================================
while true
do 
    echo "Select your option : "
    echo "1. wlan0"
    echo "2. eth0"
    echo "3. ens33"
    read options
    if (($options == 1 ))
    then
        echo "Enter mac address changing time in seconds."
        read chtime
        while true
            do
                macchanger -l > vendormac.txt
                echo ==================================================================
                ouimac=$(shuf -n 1 vendormac.txt | awk '{print$3}')
                uaamac=$(printf '%02x:%02x:%02x' $[RANDOM%256] $[RANDOM%256] $[RANDOM%256])
                sudo macchanger -m "$ouimac:$uaamac" wlan0
                sleep $chtime
            done
    elif (($options == 2))
    then
        echo "Enter mac address changing time in seconds."
        read chtime
        while true
            do
                macchanger -l > vendormac.txt
                echo ==================================================================
                ouimac=$(shuf -n 1 vendormac.txt | awk '{print$3}')
                uaamac=$(printf '%02x:%02x:%02x' $[RANDOM%256] $[RANDOM%256] $[RANDOM%256])
                sudo macchanger -m "$ouimac:$uaamac" eth0
                sleep $chtime
            done  
    elif (($options == 3))
    then
        echo "Enter mac address changing time in seconds."
        read chtime
        while true
            do
                macchanger -l > vendormac.txt
                echo ==================================================================
                ouimac=$(shuf -n 1 vendormac.txt | awk '{print$3}')
                uaamac=$(printf '%02x:%02x:%02x' $[RANDOM%256] $[RANDOM%256] $[RANDOM%256])
                sudo macchanger -m "$ouimac:$uaamac" ens33
                sleep $chtime
            done
    elif (($options == 4))
    then
        echo "Enter mac address changing time in seconds."
        read chtime
        while true
            do
                macchanger -l > vendormac.txt
                echo ==================================================================
                ouimac=$(shuf -n 1 vendormac.txt | awk '{print$3}')
                uaamac=$(printf '%02x:%02x:%02x' $[RANDOM%256] $[RANDOM%256] $[RANDOM%256])
                sudo macchanger -m "$ouimac:$uaamac" usb0
                sleep $chtime
            done
    else
        clear
        echo "Invaled option selected !!!"
        sleep 5
        clear
    fi
done