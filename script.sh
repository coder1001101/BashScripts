#!/bin/bash
clear
echo ========================================================
figlet "        CMP-Solution"
echo ========================================================
echo ========================================================
#remove old appliction
echo "removeing your old appliction"
sudo apt-get autoremove && sudo apt-get autoclear
#update command
echo "Updateing your Appliction"
sudo apt-get update && sudo apt-get upgrade -y
echo "command exucted susesfuley"
