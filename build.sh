#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

# Install nvidia-drivers
rpm-ostree install akmod-nvidia xorg-x11-drv-nvidia
rpm-ostree kargs --append=rd.driver.blacklist=nouveau --append=modprobe.blacklist=nouveau --append=nvidia-drm.modeset=1 --append=initcall_blacklist=simpledrm_platform_driver_init
