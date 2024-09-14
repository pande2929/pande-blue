#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

# Enable Hyprland repo
curl --output-dir "/etc/yum.repos.d/" --remote-name https://copr.fedorainfracloud.org/coprs/solopasha/hyprland/repo/fedora-40/solopasha-hyprland-fedora-40.repo

# Install our software
rpm-ostree install hyprland waybar flatpak sddm virt-manager alacritty gamemode vim neovim pavucontrol btop rofi-wayland

# Finalize configuration
systemctl enable sddm
systemctl enable libvirtd
