#!/bin/bash

# cat pacman-list.txt | xargs sudo pacman -S --noconfirm
PACMAN_PACKAGES=(
    "curl"
    "git"
    "vim"
    "htop"
    "firefox"
    "less"
    "fastfetch"
    "zsh"
    "eza"
    "fzf"
    "man"
)


# Update package list (for apt-based systems)
echo "Updating package list..."
sudo pacman -Syu --noconfirm

# Install each package in the list
echo "Checking and installing packages..."
tput setaf 2

for package in "${PACMAN_PACKAGES[@]}"; do
    if pacman -Qi "$package" &>/dev/null; then
        echo "Package '$package' is already installed."
    else
        echo "Installing package '$package'..."
        sudo pacman -S --noconfirm "$package"
    fi
done

# Check if yay is installed
if ! command -v yay &>/dev/null; then
    echo "Yay is not installed. Installing yay..."
    git clone https://aur.archlinux.org/yay.git
    cd yay || exit
    makepkg -si --noconfirm
    cd ..
    rm -rf yay
else
    echo "Yay is already installed."
fi

AUR_PACKAGES=(
    "neofetch"
    "visual-studio-code-bin"
)

# Install each AUR package in the list
echo "Checking and installing AUR packages..."
for aur_package in "${AUR_PACKAGES[@]}"; do
    if yay -Qi "$aur_package" &>/dev/null; then
        echo "AUR package '$aur_package' is already installed."
    else
        echo "Installing AUR package '$aur_package'..."
        yay -S --noconfirm "$aur_package"
    fi
done

