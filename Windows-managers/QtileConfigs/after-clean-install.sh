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
    "fastfetch"
    "zsh"
    "eza"
    "fzf"
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

# Set ZSH as the default shell
if [ "$SHELL" != "$(which zsh)" ]; then
    echo "Changing default shell to ZSH..."
    chsh -s "$(which zsh)"
    echo "Default shell changed to ZSH. Please log out and log back in for changes to take effect."
    echo "Current shell: $SHELL"
    # autoload -Uz zsh-newuser-install zsh-newuser-install -f
    autoload -Uz compinstall
    zhs
else
    echo "ZSH is already the default shell."
    echo $SHELL
fi

# Run Zsh for the first time to initialize:
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
    echo "Oh My Zsh is already installed."
fi

# Install additional plugins for Zsh
echo "Installing Zsh plugins..."
# Check if the custom plugins directory exists, if not create it
if [ ! -d "$HOME/.oh-my-zsh/custom/plugins" ]; then
    echo "Creating custom plugins directory..."
    mkdir -p "$HOME/.oh-my-zsh/custom/plugins"
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
else
    echo "Custom plugins directory already exists."
fi

# Create a symbolic link for the .zshrc file
if [ ! -f "$HOME/.zshrc" ]; then
    echo "Creating symbolic link for .zshrc..."
    ln -s "$HOME/Windows-managers/.zshrc" "$HOME/.zshrc"
    echo "Symbolic link for .zshrc created successfully." 
else
    echo ".zshrc already exists. Skipping symbolic link creation."
fi


# Craete files if not exists, .zshenv .zprofile, .zlogin, .zlogout
if [ ! -f "$HOME/.zshenv" ]; then
    echo "Creating .zshenv file..."
    echo "# Zsh environment variables" > "$HOME/.zshenv"
else
    echo ".zshenv already exists. Skipping creation."
fi

if [ ! -f "$HOME/.zprofile" ]; then
    echo "Creating .zprofile file..."
    echo "# Zsh profile settings" > "$HOME/.zprofile"
else
    echo ".zprofile already exists. Skipping creation."
fi

if [ ! -f "$HOME/.zlogin" ]; then
    echo "Creating .zlogin file..."
    echo "# Zsh login settings" > "$HOME/.zlogin"
else
    echo ".zlogin already exists. Skipping creation."
fi

if [ ! -f "$HOME/.zlogout" ]; then
    echo "Creating .zlogout file..."
    echo "# Zsh logout settings" > "$HOME/.zlogout"
else
    echo ".zlogout already exists. Skipping creation."
fi

# Create a symbolic link for the .bashrc file
if [ ! -f "$HOME/.bashrc" ]; then
    echo "Creating symbolic link for .bashrc..."
    ln -s "$HOME/Windows-managers/.bashrc" "$HOME/.bashrc"
else
    echo ".bashrc already exists. Skipping symbolic link creation."
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