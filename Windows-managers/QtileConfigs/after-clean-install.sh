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

sh ./scripts/install-pkgs.sh
sh ./scripts/install-zsh.sh
sh ./scripts/install-alacritty.sh
sh ./scripts/install-fastfetch.sh
sh ./scripts/initialize-git.sh


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

# Check if config.py file exist in the Qtile directory and its symbolic links, If its regular file, delete it, If its Symbolic, do nothing.
if [ -f "$HOME/.config/qtile/config.py" ] && [ ! -L "$HOME/.config/qtile/config.py" ]; then
    echo "Found a regular config.py file in the Qtile directory. Deleting it..."
    rm "$HOME/.config/qtile/config.py"
    echo "Creating symbolic link for config.py..."
    ln -s "$HOME/Linux-Files/Windows-managers/QtileConfigs/.config/qtile/config.py" "$HOME/.config/qtile/config.py"
    echo "Symbolic link for config.py created successfully."
else
    echo "No regular config.py file found or it is already a symbolic link."
    # If it's a symbolic link, do nothing, else create a symbolic link
    if [ -L "$HOME/.config/qtile/config.py" ]; then
        echo "config.py is already a symbolic link."
    else
        echo "Creating symbolic link for config.py..."
        ln -s "$HOME/Linux-Files/Windows-managers/QtileConfigs/.config/qtile/config.py" "$HOME/.config/qtile/config.py"
        echo "Symbolic link for config.py created successfully."
    fi
fi



echo
tput setaf 3
echo "################################################################"
echo "################### End Qtile Configurations ###################"
echo "################################################################"
tput sgr0
echo