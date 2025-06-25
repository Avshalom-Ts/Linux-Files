# This guid show how to configure qtile For my tast

1. Download the [archlinux iso](https://archlinux.interhost.co.il/iso/2025.06.01/)

2. Istall the archlinux with the archinstall script, Select type: Descktop: Qtile

3. Install Packages:

    ```bash
    sudo pacman -S \
    git \
    dmenu -y
    ```

    Copy the config for qtile to `~/.config/qtile/config.py`

    ```bash
    cd Linux-Files
    cp Windows-managers/QtileConfigs/.config/qtile/config.py ~/.config/qtile/config.py
    ```
