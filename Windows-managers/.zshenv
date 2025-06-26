# Zsh environment variables
# instance, we can set the locations for other programs’ dotfiles. In addition, the file can also include the ZDOTDIR environment variable.

# It’s read very early in the shell init process so that the variables are readily available.

# Here’s a simple .zshenv file:

export XDG_CONFIG_HOME="$HOME/.config"
# export ZDOTDIR="$HOME/zsh"

export EDITOR="vim"

export LC_ALL="en_US.UTF-8"
# export GOPATH="$HOME/.local/share/go"

export LESS="-R"

umask 022