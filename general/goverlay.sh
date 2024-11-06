#!/bin/bash

set -ouex pipefail

rpmfusion=(
    "https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm"
    "https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm"
)
rpm -q rpmfusion-free-release rpmfusion-nonfree-release || rpm-ostree install ${rpmfusion[@]}

install_packages=(
    "goverlay"
)
rpm -q ${install_packages[@]} || rpm-ostree install ${install_packages[@]}

remove_packages=(
    ""
)
rpm -q ${remove_packages[@]} || rpm-ostree uninstall ${remove_packages[@]}
