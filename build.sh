#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

# Enable Hyprland
curl --output-dir "/etc/yum.repos.d/" --remote-name https://copr.fedorainfracloud.org/coprs/solopasha/hyprland/repo/fedora-40/solopasha-hyprland-fedora-40.repo

# Install our software
rpm-ostree install hyprland-git flatpak sddm virt-manager alacritty gamemode vim neovim pavucontrol btop rofi-wayland thunar \
  hyprpaper hyprlock hypridle xdg-desktop-portal-hyprland waybar-git hyprcursor hyprland-plugins-git hyprshot cmake meson cpio \
  gnu-free-fonts-common gnu-free-mono-fonts gnu-free-sans-fonts gnu-free-serif-fonts

# Finalize configuration
systemctl enable sddm
systemctl enable libvirtd
