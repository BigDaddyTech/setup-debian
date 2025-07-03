#!/usr/bin/env bash

# Install GNOME and other utilities
apt install -y gnome-shell gnome-terminal curl fastfetch gnome-disk-utility evince eog mangohud tree gnome-calculator gnome-software wine git arduino

# Cleanup bloat from gnome-shell
apt -y remove malcontent yelp nm-connection-editor im-config

# Setup minimize and maximize buttons on windows
gsettings set org.gnome.desktop.wm.preferences button-layout ":minimize,maximize,close"

# Setup aliases in .bashrc
echo 'alias ll="ls -la"' >> ~/.bashrc

# Install Brave
curl -fsS https://dl.brave.com/install.sh | sh

# Install Steam
dpkg --add-architecture i386
echo 'deb http://deb.debian.org/debian/ trixie main contrib non-free non-free-firmware' >> /etc/apt/sources.list
apt update -y
apt install -y steam-libs steam

# Install Discord
discord_url="https://discord.com/api/download?platform=linux&format=deb"
curl -L -o /tmp/discord.deb $discord_url
apt install -y /tmp/discord.deb

# Install OnlyOffice
wget https://github.com/ONLYOFFICE/DesktopEditors/releases/latest/download/onlyoffice-desktopeditors_amd64.deb
apt install -y ./onlyoffice-desktopeditors_amd64.deb
rm -f ./onlyoffice-desktopeditors_amd64.deb

# Install VSCodium
wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg | gpg --dearmor | sudo dd of=/usr/share/keyrings/vscodium-archive-keyring.gpg
echo 'deb [arch=amd64,arm64 signed-by=/usr/share/keyrings/vscodium-archive-keyring.gpg] https://download.vscodium.com/debs vscodium main' | sudo tee /etc/apt/sources.list.d/vscodium.list
apt update -y
apt install -y codium

# Install FreeCAD
add-apt-repository ppa:freecad-maintainers/freecad-stable
apt update -y
apt install -y freecad
