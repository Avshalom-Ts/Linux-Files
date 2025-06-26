#!/bin/bash

# Create a symbolic link for alacritty config file
if [ ! -d "$HOME/.config/alacritty" ]; then
    echo "Creating alacritty config directory..."
    mkdir -p "$HOME/.config/alacritty"
fi

if [ ! -f "$HOME/.config/alacritty/alacritty.toml" ]; then
    echo "Creating symbolic link for alacritty config file..."
    ln -s "$HOME/Linux-Files/Windows-managers/QtileConfigs/.config/alacritty/alacritty.toml" "$HOME/.config/alacritty/alacritty.toml"
    
else
    echo "Alacritty config file already exists. Skipping symbolic link creation."
fi