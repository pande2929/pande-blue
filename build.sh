#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

# Install our software
rpm-ostree install mangohud \
virt-manager \
btop \
neovim #\
#gnome-software \
#gnome-disk-utility \
#xinput \
#alacritty

# Install fsync kernel
# https://copr.fedorainfracloud.org/coprs/sentry/kernel-fsync/
#curl -LsSf -o /etc/yum.repos.d/_copr_sentry-kernel-fsync.repo \
    #https://copr.fedorainfracloud.org/coprs/sentry/kernel-fsync/repo/fedora-$(rpm -E %fedora)/sentry-kernel-fsync-fedora-$(rpm -E %fedora).repo
#rpm-ostree cliwrap install-to-root /
#rpm-ostree override replace \
#--experimental \
#--from repo=copr:copr.fedorainfracloud.org:sentry:kernel-fsync \
    #kernel \
    #kernel-core \
    #kernel-devel \
    #kernel-devel-matched \
    #kernel-modules \
    #kernel-modules-core \
    #kernel-modules-extra \
    #kernel-uki-virt

# Install Nvidia
#rpm-ostree install /tmp/rpms/ublue-os/ublue-os-nvidia*.rpm
#rpm-ostree install /tmp/rpms/kmods/kmod-nvidia*.rpm

# Remove Firefox (we will install with Flathub)
rpm-ostree override remove firefox firefox-langpacks

# Complete configuration
systemctl enable libvirtd
