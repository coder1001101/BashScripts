#!/bin/bash
clear
figlet "        Welcome"
shutdown +1
echo Enter your username :
read username
echo Enter your password :
read password
if [[ ( $username == "username" && $password == "password")]]; then
echo  Congratulations your are logged In
else
echo shouting down your computer
figlet "Khatam tata bye bye gaya" && sleep 5s; shutdown -h now
fi
