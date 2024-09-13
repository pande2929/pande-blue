#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

# Install nvidia-drivers
rpm-ostree install akmod-nvidia xorg-x11-drv-nvidia
rpm-ostree kargs --append=rd.driver.blacklist=nouveau --append=modprobe.blacklist=nouveau --append=nvidia-drm.modeset=1 --append=initcall_blacklist=simpledrm_platform_driver_init

# Install LXQT
rpm-ostree install breeze-cursor-theme breeze-gtk breeze-icon-theme dnfdragora-updater falkon firewall-config initial-setup-gui \
  lxqt-about lxqt-archiver lxqt-config lxqt-globalkeys lxqt-notificationd lxqt-openssh-askpass lxqt-panel lxqt-policykit \ 
  lxqt-powermanagement lxqt-qtplugin lxqt-runner lxqt-session lxqt-themes lxqt-themes-fedora network-manager-applet nm-connection-editor \ 
  notification-daemon obconf openbox pcmanfm-qt perl-File-MimeInfo qterminal sddm sddm-themes sddm-x11 upower xdg-user-dirs --allow-inactive

# Install virtualization
rpm-ostree install virt-manager
systemctl enable libvirtd

# Remove firefox (use flathub version instead)
rpm-ostree override remove firefox firefox-langpacks

