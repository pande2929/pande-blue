#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

# Enable Hyprland
curl --output-dir "/etc/yum.repos.d/" --remote-name https://copr.fedorainfracloud.org/coprs/solopasha/hyprland/repo/fedora-40/solopasha-hyprland-fedora-40.repo

rpm-ostree cleanup -m

# Install our software
rpm-ostree install flatpak sddm virt-manager alacritty gamemode vim neovim #pavucontrol #btop thunar
#rpm-ostree install hyprland-git flatpak sddm virt-manager alacritty gamemode vim neovim pavucontrol btop rofi-wayland thunar #\
  #hyprpaper hyprlock hypridle xdg-desktop-portal-hyprland waybar-git hyprcursor hyprshot #\
  #gnu-free-fonts-common gnu-free-mono-fonts gnu-free-sans-fonts gnu-free-serif-fonts

# Finalize configuration
#systemctl enable sddm
#systemctl enable libvirtd
