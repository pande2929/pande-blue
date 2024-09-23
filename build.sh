#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

# Enable fysnc copr
#curl --output-dir "/etc/yum.repos.d/" --remote-name https://copr.fedorainfracloud.org/coprs/sentry/kernel-fsync/repo/fedora-40/sentry-kernel-fsync-fedora-40.repo
#echo exclude=kernel* >> /etc/yum.repos.d/fedora-updates

#rpm-ostree cleanup -m

# Install our software
rpm-ostree install gdm \
mangohud \
virt-manager \
btop \
xfce4-clipman-plugin \
xfce4-cpugraph-plugin \
xfce4-datetime-plugin \
xfce4-dict \
xfce4-dict-plugin \
xfce4-diskperf-plugin \
xfce4-eyes-plugin \
xfce4-fsguard-plugin \
xfce4-genmon-plugin \
xfce4-mailwatch-plugin \
xfce4-mount-plugin \
xfce4-mpc-plugin \
xfce4-netload-plugin \
xfce4-notes-plugin \
xfce4-places-plugin \
xfce4-power-manager \
xfce4-screenshooter \
xfce4-screenshooter-plugin \
xfce4-sensors-plugin \
xfce4-smartbookmark-plugin \
xfce4-systemload-plugin \
xfce4-taskmanager \
xfce4-time-out-plugin \
xfce4-timer-plugin \
xfce4-verve-plugin \
xfce4-wavelan-plugin \
xfce4-weather-plugin \
xfce4-xkb-plugin \
orage \
parole \
ristretto \
xfce4-volumed \
xfconf \
xfdesktop \
xfmpc \
xfwm4 \
xscreensaver-base \
xorg-x11-drv-nvidia-cuda

# Install fsync kernel
# https://copr.fedorainfracloud.org/coprs/sentry/kernel-fsync/
#rpm-ostree override replace --experimental --freeze --from repo='copr:copr.fedorainfracloud.org:sentry:kernel-fsync' kernel kernel-core kernel-modules kernel-modules-core kernel-modules-extra kernel-devel

# Complete configuration
systemctl enable libvirtd
systemctl enable gdm
