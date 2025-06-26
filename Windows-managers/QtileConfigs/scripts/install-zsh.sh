
#!/bin/bash

# Check if .zshrc file exist in the home directory and its symbolic links, If its regular file, delete it, If its Symbolic, do nothing.
echo "Creating Symbolic link for .zshrc"
if [ -f "$HOME/.zshrc" ] && [ ! -L "$HOME/.zshrc" ]; then
    echo "Found a regular .zshrc file in the home directory OR its Symbolic link . Deleting it..."
    rm "$HOME/.zshrc"
else
    echo "No regular .zshrc file found or it is already a symbolic link."
    # If it's a symbolic link, do nothing, else create a symbolic link
    if [ -L "$HOME/.zshrc" ]; then
        echo ".zshrc is already a symbolic link."
    else
        echo "Creating symbolic link for .zshrc..."
        ln -s "$HOME/Linux-Files/Windows-managers/.zshrc" "$HOME/.zshrc"
        echo "Symbolic link for .zshrc created successfully."
        
    fi
fi


# Check if .zshenv file exist in the home directory and its symbolic links, If its regular file, delete it, If its Symbolic, do nothing.
if [ -f "$HOME/.zshenv" ] && [ ! -L "$HOME/.zshenv" ]; then
    echo "Found a regular .zshenv file in the home directory. Deleting it..."
    rm "$HOME/.zshenv"
else
    echo "No regular .zshenv file found or it is already a symbolic link."
    # If it's a symbolic link, do nothing, else create a symbolic link
    if [ -L "$HOME/.zshenv" ]; then
        echo ".zshenv is already a symbolic link."
    else
        echo "Creating symbolic link for .zshenv..."
        ln -s "$HOME/Linux-Files/Windows-managers/.zshenv" "$HOME/.zshenv"
        echo "Symbolic link for .zshenv created successfully."
        
    fi
fi


# Check if .zprofile file exist in the home directory and its symbolic links, If its regular file, delete it, If its Symbolic, do nothing.
if [ -f "$HOME/.zprofile" ] && [ ! -L "$HOME/.zprofile" ]; then
    echo "Found a regular .zprofile file in the home directory. Deleting it..."
    rm "$HOME/.zprofile"
else
    echo "No regular .zprofile file found or it is already a symbolic link."
    # If it's a symbolic link, do nothing, else create a symbolic link
    if [ -L "$HOME/.zprofile" ]; then
        echo ".zprofile is already a symbolic link."
    else
        echo "Creating symbolic link for .zprofile..."
        ln -s "$HOME/Linux-Files/Windows-managers/.zprofile" "$HOME/.zprofile"
        echo "Symbolic link for .zprofile created successfully."
        
    fi
fi


# Check if .zlogin file exist in the home directory and its symbolic links, If its regular file, delete it, If its Symbolic, do nothing.
if [ -f "$HOME/.zlogin" ] && [ ! -L "$HOME/.zlogin" ]; then
    echo "Found a regular .zlogin file in the home directory. Deleting it..."
    rm "$HOME/.zlogin"
else
    echo "No regular .zlogin file found or it is already a symbolic link."
    # If it's a symbolic link, do nothing, else create a symbolic link
    if [ -L "$HOME/.zlogin" ]; then
        echo ".zlogin is already a symbolic link."
    else
        echo "Creating symbolic link for .zlogin..."
        ln -s "$HOME/Linux-Files/Windows-managers/.zlogin" "$HOME/.zlogin"
        echo "Symbolic link for .zlogin created successfully."
        
    fi
fi

# Check if .zlogout file exist in the home directory and its symbolic links, If its regular file, delete it, If its Symbolic, do nothing.
if [ -f "$HOME/.zlogout" ] && [ ! -L "$HOME/.zlogout" ]; then
    echo "Found a regular .zlogout file in the home directory. Deleting it..."
    rm "$HOME/.zlogout"
else
    echo "No regular .zlogout file found or it is already a symbolic link."
    # If it's a symbolic link, do nothing, else create a symbolic link
    if [ -L "$HOME/.zlogout" ]; then
        echo ".zlogout is already a symbolic link."
    else
        echo "Creating symbolic link for .zlogout..."
        ln -s "$HOME/Linux-Files/Windows-managers/.zlogout" "$HOME/.zlogout"
        echo "Symbolic link for .zlogout created successfully."
        
    fi
fi

# Set ZSH as the default shell
if [ "$SHELL" != "$(which zsh)" ]; then
    echo "Changing default shell to ZSH..."
    chsh -s "$(which zsh)"
    echo "Default shell changed to ZSH. Please log out and log back in for changes to take effect."
    echo "Current shell: $SHELL"
    # autoload -Uz zsh-newuser-install zsh-newuser-install -f
    # autoload -Uz compinstall
    zsh
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
else
    echo "Custom plugins directory already exists."
fi

# Check if the plugins are already installed
if [ -d "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" ]; then
    echo "zsh-syntax-highlighting plugin is already installed."
else
    echo "Installing zsh-syntax-highlighting plugin..."
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
fi

if [ -d "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ]; then
    echo "zsh-autosuggestions plugin is already installed."
else
    echo "Installing zsh-autosuggestions plugin..."
    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
fi

