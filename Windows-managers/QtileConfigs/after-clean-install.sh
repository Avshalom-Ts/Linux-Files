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

# cat pacman-list.txt | xargs sudo pacman -S --noconfirm
PACMAN_PACKAGES=(
    "curl"
    "git"
    "vim"
    "htop"
    "firefox"
    "less"
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