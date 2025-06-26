#!/bin/bash


echo
tput setaf 3
echo "##################################################################"
echo "##################### Copy FASTFETCH configs #####################"
echo "##################################################################"
tput sgr0
echo

# Check if fastfetch folder exist in the home directory, If it does not exist, create it.
if [ ! -d "$HOME/.config/fastfetch" ]; then
    echo "Creating fastfetch config directory..."
    mkdir -p "$HOME/.config/fastfetch"
fi

# Check if config-compact.jsonc file exist in the fastfetch directory and its symbolic links, If its Symbolic, do nothing.
if [ ! -L "$HOME/.config/fastfetch/config-compact.jsonc" ]; then
    echo "Creating symbolic link for fastfetch config file..."
    ln -s "$HOME/Linux-Files/Windows-managers/QtileConfigs/.config/fastfetch/config-compact.jsonc" "$HOME/.config/fastfetch/config-compact.jsonc"
else
    echo "fastfetch config file already exists. Skipping symbolic link creation."
fi

# Check if config-v2.jsonc file exist in the fastfetch directory and its symbolic links, If its Symbolic, do nothing.
if [ ! -L "$HOME/.config/fastfetch/config-v2.jsonc" ]; then
    echo "Creating symbolic link for fastfetch config file..."
    ln -s "$HOME/Linux-Files/Windows-managers/QtileConfigs/.config/fastfetch/config-v2.jsonc" "$HOME/.config/fastfetch/config-v2.jsonc"
else
    echo "fastfetch config file already exists. Skipping symbolic link creation."
fi

# Check if config.jsonc file exist in the fastfetch directory and its symbolic links, If its Symbolic, do nothing.
if [ ! -L "$HOME/.config/fastfetch/config.jsonc" ]; then
    echo "Creating symbolic link for fastfetch config file..."
    ln -s "$HOME/Linux-Files/Windows-managers/QtileConfigs/.config/fastfetch/config.jsonc" "$HOME/.config/fastfetch/config.jsonc"
else
    echo "fastfetch config file already exists. Skipping symbolic link creation."
fi



echo
tput setaf 3
echo "##################################################################"
echo "########################## FASTFETCH END #########################"
echo "##################################################################"
tput sgr0
echo