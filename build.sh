#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

# Install nvidia-drivers
rpm-ostree install akmod-nvidia xorg-x11-drv-nvidia
rpm-ostree kargs --append=rd.driver.blacklist=nouveau --append=modprobe.blacklist=nouveau --append=nvidia-drm.modeset=1 --append=initcall_blacklist=simpledrm_platform_driver_init

# Install hyprland
curl --output-dir "/etc/yum.repos.d/" --remote-name https://copr.fedorainfracloud.org/coprs/solopasha/hyprland/repo/fedora-40/solopasha-hyprland-fedora-40.repo
rpm-ostree refresh-md --force
rpm-ostree hyprland 

# Install greetd / tuigreet
rpm-ostree greetd tuigreet

# Install virtualization
rpm-ostree install virt-manager
systemctl enable libvirtd

# Remove firefox (use flathub version instead)
rpm-ostree override remove firefox firefox-langpacks
