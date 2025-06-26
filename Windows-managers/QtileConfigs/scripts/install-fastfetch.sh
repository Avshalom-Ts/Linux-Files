#!/bin/bash


# Create a symbolic link for the fastfetch config file
if [ ! -d "$HOME/.config/fastfetch" ]; then
    echo "Creating fastfetch config directory..."
    mkdir -p "$HOME/.config/fastfetch"
fi

if [ ! -f "$HOME/.config/fastfetch/config-compact.jsonc" ]; then
    echo "Creating symbolic link for fastfetch config file..."
    ln -s "$HOME/Linux-Files/Windows-managers/QtileConfigs/.config/fastfetch/config-compact.jsonc" "$HOME/.config/fastfetch/config-compact.jsonc"
else
    echo "fastfetch config file already exists. Skipping symbolic link creation."
fi

if [ ! -f "$HOME/.config/fastfetch/config-v2.jsonc" ]; then
    echo "Creating symbolic link for fastfetch config file..."
    ln -s "$HOME/Linux-Files/Windows-managers/QtileConfigs/.config/fastfetch/config-v2.jsonc" "$HOME/.config/fastfetch/config-v2.jsonc"
else
    echo "fastfetch config file already exists. Skipping symbolic link creation."
fi

if [ ! -f "$HOME/.config/fastfetch/config.jsonc" ]; then
    echo "Creating symbolic link for fastfetch config file..."
    ln -s "$HOME/Linux-Files/Windows-managers/QtileConfigs/.config/fastfetch/config.jsonc" "$HOME/.config/fastfetch/config.jsonc"
else
    echo "fastfetch config file already exists. Skipping symbolic link creation."
fi

