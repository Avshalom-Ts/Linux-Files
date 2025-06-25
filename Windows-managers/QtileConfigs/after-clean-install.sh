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

pacman-packages=(git dmenu firefox)

for package in "${pacman-packages[@]}"; do
    if pacman -Qi "$package" &>/dev/null; then
        echo "Package '$package' is already installed."
    else
        echo "Installing package '$package'..."
        sudo pacman -S --noconfirm "$package"
    fi
done

echo
tput setaf 3
echo "################################################################"
echo "######################## Git Initialize  #######################"
echo "################################################################"
tput sgr0
echo

# Check if git is configured
if git config --global user.name &>/dev/null && git config --global user.email &>/dev/null; then
    echo "Git is already configured."
else
    echo "Configuring Git..."
    git config --global pull.rebase false
    git config --global push.default simple
    git config --global user.name "Avshalom-Ts"
    git config --global user.email "avshalomz.ts@gmail.com"
    sudo git config --system core.editor vim
fi



git_user=$(git config user.name)
git_email=$(git config user.email)

echo "-----------------------------------------------------------------------------"
echo "Git New Credentials:"
echo "Git User Name: $git_user"
echo "Git User Email: $git_email"
echo "-----------------------------------------------------------------------------"

echo
tput setaf 3
echo "################################################################"
echo "################### Git Initialize End #########################"
echo "################################################################"
tput sgr0
echo

echo
tput setaf 3
echo "################################################################"
echo "################### End Qtile Configurations ###################"
echo "################################################################"
tput sgr0
echo