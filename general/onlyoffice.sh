#!/bin/bash

set -ouex pipefail

wget $(curl -s https://api.github.com/repos/ONLYOFFICE/DesktopEditors/releases/latest | jq -r '.assets[] | select(.name | contains ("onlyoffice-desktopeditors.x86_64.rpm")) | .browser_download_url')

https://github.com/ONLYOFFICE/DesktopEditors/releases/latest

rpmfusion=(
    "https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm"
    "https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm"
)
rpm -q rpmfusion-free-release rpmfusion-nonfree-release || rpm-ostree install ${rpmfusion[@]}

install_packages=(
    "onlyoffice-desktopeditors.x86_64.rpm"
)
rpm -q ${install_packages[@]} || rpm-ostree install ${install_packages[@]}

remove_packages=(
    ""
)
rpm -q ${remove_packages[@]} || rpm-ostree uninstall ${remove_packages[@]}

wget -O onlyoffice-latest.rpm $(curl -s https://api.github.com/repos/ONLYOFFICE/DesktopEditors/releases/latest | jq -r '.assets[] | select(.name | contains ("onlyoffice-desktopeditors.x86_64.rpm")) | .browser_download_url')

