#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

# Install hyprland
curl --output-dir "/etc/yum.repos.d/" --remote-name https://copr.fedorainfracloud.org/coprs/solopasha/hyprland/repo/fedora-40/solopasha-hyprland-fedora-40.repo
#rpm-ostree refresh-md --force
rpm-ostree install hyprland waybar flatpak

# Install greetd / tuigreet
rpm-ostree install greetd tuigreet
curl --output-dir "/etc/greetd/" --remote-name https://raw.githubusercontent.com/pande2929/pande-blue/main/config.toml
systemctl enable greetd

# Install virtualization
#rpm-ostree install virt-manager
#systemctl enable libvirtd
