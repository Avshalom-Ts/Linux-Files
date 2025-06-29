#!/bin/bash


echo
tput setaf 2
echo "#################################################################"
echo "######################### Copy LightDM Conf #####################"
echo "#################################################################"
tput sgr0
echo


# Copy the lightdm configuration file to the appropriate directory
sudo cp /home/azarviv/Linux-Files/Windows-managers/QtileConfigs/etc/lightdm/lightdm.conf /etc/lightdm/lightdm.conf
# Copy the lightdm-webkit2-greeter configuration file to the appropriate directory
sudo cp /home/azarviv/Linux-Files/Windows-managers/QtileConfigs/etc/lightdm/lightdm-webkit2-greeter.conf /etc/lightdm/lightdm-webkit2-greeter.conf
# Copy the lightdm-web-greeter configuration file to the appropriate directory
sudo cp /home/azarviv/Linux-Files/Windows-managers/QtileConfigs/etc/lightdm/web-greeter.yml /etc/lightdm/web-greeter.yml
