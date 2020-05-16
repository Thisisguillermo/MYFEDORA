################################################################################
#                              Bash script template                            #
#                                                                              #
# Installing software for Fedora                                               #
#                                                                              #
#                                                                              #
# Usage: sudo -u $USER ./MYFEDORA.sh                                           #
#                           Original code.                                     #
#                                                                              #
#                                                                              #
#                                                                              #
#                                                                              #
################################################################################

#!/bin/bash

sudo dnf update -y

sudo dnf install -y \
https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

sudo dnf groupinstall -y "Virtualization" --skip-broken
sudo dnf groupinstall -y "Container Management" --skip-broken
sudo dnf groupinstall -y "Design Suite" --skip-broken &&
sudo dnf groupinstall -y "Development Tools" --skip-broken &&
sudo dnf groupinstall -y "Vagrant with libvirt support" --skip-broken
sudo dnf groupinstall -y "System tools" --skip-broken
sudo dnf groupinstall -y "Text-based Internet" --skip-broken
sudo dnf groupinstall -y "Administration Tools" --skip-broken
sudo dnf groupinstall -y "Multimedia" --skip-broken

sudo usermod -a -G libvirt $(whoami)

sudo dnf install -y gnupg2
sudo dnf install -y pass
sudo dnf install -y ShellCheck
sudo dnf install -y elinks
sudo dnf install -y autossh
sudo dnf install -y surfraw 
sudo dnf install -y googler 
sudo dnf install -y jpegoptim 
sudo dnf install -y ffmpeg 
sudo dnf install -y gnome-tweaks 
sudo dnf install -y gnome-documents
sudo dnf install -y toolbox 
sudo dnf install -y deja-dup 
sudo dnf install -y chrome-gnome-shell 
sudo dnf install -y vim 
sudo dnf install -y thunderbird 
sudo dnf install -y podman-docker 
sudo dnf install -y zram 
sudo dnf install -y tlp 
sudo dnf install -y ansible 
sudo dnf install -y obs-studio
sudo dnf install -y peek
sudo dnf install -y seahorse 
sudo dnf install -y transmission
sudo dnf install -y mediawriter
sudo dnf install -y gnome-shell-extension-openweather 
sudo dnf install -y gnome-shell-extension-gsconnect 
sudo dnf install -y webextension-gsconnect.x86_64 

sudo dnf install -y redhat-text-fonts.noarch redhat-display-fonts.noarch

sudo dnf install -y flameshot
flameshot config -f %T_%F

sudo dnf install -y clamav clamav-update clamtk
sudo freshclam

sudo dnf install -y fedora-workstation-repositories

sudo dnf config-manager --set-enabled google-chrome
sudo dnf install -y google-chrome-stable

sudo systemctl enable zram-swap.service
sudo systemctl start zram-swap.service

sudo dnf install -y earlyoom
sudo systemctl enable --now earlyoom

sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc

cat <<EOF | sudo tee /etc/yum.repos.d/vscode.repo
[code]
name=Visual Studio Code
baseurl=https://packages.microsoft.com/yumrepos/vscode
enabled=1
gpgcheck=1
gpgkey=https://packages.microsoft.com/keys/microsoft.asc
EOF

sudo dnf check-update
sudo dnf install -y code

sudo dnf install -y adapta-gtk-theme-gedit.noarch
sudo dnf install -y flat-remix-icon-theme.noarch
sudo dnf install -y la-capitaine-cursor-theme

export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus"

gsettings set org.gnome.desktop.interface gtk-theme "Adapta"
gsettings set org.gnome.desktop.interface icon-theme "Flat-Remix-Green"
gsettings set org.gnome.desktop.interface cursor-theme "La-Capitaine"

# Workstation/Third Party Software Repositories
# https://fedoraproject.org/wiki/Workstation/Third_Party_Software_Repositories
