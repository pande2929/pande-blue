#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

# Enable fysnc copr
#curl --output-dir "/etc/yum.repos.d/" --remote-name https://copr.fedorainfracloud.org/coprs/sentry/kernel-fsync/repo/fedora-40/sentry-kernel-fsync-fedora-40.repo
#echo exclude=kernel* >> /etc/yum.repos.d/fedora-updates

#rpm-ostree cleanup -m

# Install our software
rpm-ostree install mangohud virt-manager btop akmod-nvidia xorg-x11-drv-nvidia
#rpm-ostree kargs --append=rd.driver.blacklist=nouveau --append=modprobe.blacklist=nouveau --append=nvidia-drm.modeset=1

# Install fsync kernel
# https://copr.fedorainfracloud.org/coprs/sentry/kernel-fsync/
#rpm-ostree override replace --experimental --freeze --from repo='copr:copr.fedorainfracloud.org:sentry:kernel-fsync' kernel kernel-core kernel-modules kernel-modules-core kernel-modules-extra kernel-devel

# Complete configuration
systemctl enable libvirtd
