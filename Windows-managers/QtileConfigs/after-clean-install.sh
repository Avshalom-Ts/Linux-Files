#!/bin/bash

#####################################################################################
#############################
# Author    : Avshalom Zarviv
# Website   : https://www.avshalom-folio.com
#####################################################################################
#############################

echo
tput setaf 3
echo "##################################################################"
echo "################### Start Qtile Configurations ###################"
echo "#####################Istall Qtile Dependencies####################"
tput sgr0
echo

#Make all scripts executable
echo "Making all scripts executable..."
chmod +x scripts/*.sh

sh ./scripts/install-pkgs.sh
sh ./scripts/install-zsh.sh
sh ./scripts/install-alacritty.sh
sh ./scripts/install-fastfetch.sh
sh ./scripts/initialize-git.sh

# Check if exit code is 0, if not exit the script
if [ $? -ne 0 ]; then
    RED='\033[0;31m'
    NC='\033[0m' # No Color
    printf "I ${RED}love${NC} Stack Overflow\n"
    echo "An error occurred during the installation of packages. Exiting..."
    exit 1
fi


# Create a symbolic link for the .bashrc file
if [ ! -f "$HOME/.bashrc" ]; then
    echo "Creating symbolic link for .bashrc..."
    ln -s "$HOME/Linux-Files/Windows-managers/.bashrc" "$HOME/.bashrc"
else
    echo ".bashrc already exists. Skipping symbolic link creation."
fi

echo
tput setaf 3
echo "################################################################"
echo "################### End Qtile Configurations ###################"
echo "################################################################"
tput sgr0
echo