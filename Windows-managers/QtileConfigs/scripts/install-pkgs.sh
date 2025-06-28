#!/bin/bash

#####################################################################################
#############################
# Author    : Avshalom Zarviv
# Website   : https://www.avshalom-folio.com
#####################################################################################
#############################

echo
tput setaf 2
echo "#################################################################"
echo "###################### Istall Pacman Pakcages ###################"
echo "#################################################################"
tput sgr0
echo


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
    "xorg-xrandr"
    "autorandr"
<<<<<<< HEAD
    "meld"
=======
    "lightdm-webkit2-greeter"
>>>>>>> 7dc8d9c (Add LightDM configuration files and update copy script)
)


AUR_PACKAGES=(
    "neofetch"
    "visual-studio-code-bin"
    "microsoft-edge-stable-bin"
    "discord"
    "google-chrome"
    "youtube-music"
)


# Update package list (for apt-based systems)
echo "Updating package list..."
sudo pacman -Syu --noconfirm

# Install each pacman package in the list
echo "Checking and installing packages..."
tput sgr0

for package in "${PACMAN_PACKAGES[@]}"; do
    if pacman -Qi "$package" &>/dev/null; then
        echo -e "\031[0;32mPackage '$package' is already installed.\031[0m"
        tput sgr0
    else
        echo "Installing package '$package'..."
        sudo pacman -S --noconfirm "$package"
    fi
done

echo
tput setaf 3
echo "#################################################################"
echo "####################### Istall AUR Pakcages #####################"
echo "#################################################################"
tput sgr0
echo


# Check if yay is installed
echo "Checking and installing PACMAN packages..."
tput sgr0
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


# Install each AUR package in the list
echo "Checking and installing AUR packages..."
tput sgr0
for aur_package in "${AUR_PACKAGES[@]}"; do
    if yay -Qi "$aur_package" &>/dev/null; then
        echo "AUR package '$aur_package' is already installed."
        tput sgr0
    else
        echo "Installing AUR package '$aur_package'..."
        yay -S --noconfirm "$aur_package"
    fi
done



echo
tput setaf 3
echo "#################################################################"
echo "#################### Finish Install Pakcages ####################"
echo "#################################################################"
tput sgr0
echo