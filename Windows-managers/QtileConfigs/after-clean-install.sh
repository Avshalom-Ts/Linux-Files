#!/bin/bash

#####################################################################################
#############################
echo "Author    : Avshalom Zarviv"
echo "Website   : https://www.avshalom-folio.com"
#####################################################################################
#############################

echo "
       ###           ##########
      ## ##                ##
     ##   ##              ##
    ##     ##            ##
    #########          ##
    ##     ##        ##
    ##     ##      ##########
"

echo
tput setaf 3
echo "##################################################################"
echo "################### Start Qtile Configurations ###################"
echo "##################################################################"
tput sgr0
echo

#Make all scripts executable
echo "Making all scripts executable..."
chmod +x scripts/*.sh

./scripts/install-pkgs.sh
./scripts/install-zsh.sh
./scripts/install-alacritty.sh
./scripts/install-fastfetch.sh


# Check if .bashrc file exist in the home directory and its symbolic links, If its regular file, delete it, If its Symbolic, do nothing.
if [ -f "$HOME/.bashrc" ] && [ ! -L "$HOME/.bashrc" ]; then
    echo "Found a regular .bashrc file in the home directory. Deleting it..."
    rm "$HOME/.bashrc"
else
    echo "No regular .bashrc file found or it is already a symbolic link."
    # If it's a symbolic link, do nothing, else create a symbolic link
    if [ -L "$HOME/.bashrc" ]; then
        echo ".bashrc is already a symbolic link."
    else
        echo "Creating symbolic link for .bashrc..."
        ln -s "$HOME/Linux-Files/Windows-managers/.bashrc" "$HOME/.bashrc"
        echo "Symbolic link for .bashrc created successfully."
    fi
fi


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