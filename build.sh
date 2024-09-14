#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

# Enable Hyprland repo
curl --output-dir "/etc/yum.repos.d/" --remote-name https://copr.fedorainfracloud.org/coprs/solopasha/hyprland/repo/fedora-40/solopasha-hyprland-fedora-40.repo

# Install our software
rpm-ostree install hyprland waybar flatpak sddm virt-manager alacritty

# Finalize configuration
#curl --output-dir "/etc/greetd/" --remote-name https://raw.githubusercontent.com/pande2929/pande-blue/main/config.toml
#systemctl enable greetd
systemctl enable sddm
systemctl enable libvirtd
