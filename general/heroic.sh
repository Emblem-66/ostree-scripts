#!/bin/bash

set -ouex pipefail

curl -o /etc/yum.repos.d/_copr_heroic.repo "https://copr.fedorainfracloud.org/coprs/atim/heroic-games-launcher/repo/fedora-rawhide/atim-heroic-games-launcher-fedora-rawhide.repo"

wget $(curl -s https://api.github.com/repos/Heroic-Games-Launcher/HeroicGamesLauncher/releases/latest | jq -r '.assets[] | select(.name | contains ("rpm")) | .browser_download_url')

rpmfusion=(
    "https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm"
    "https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm"
)
rpm -q rpmfusion-free-release rpmfusion-nonfree-release || rpm-ostree install ${rpmfusion[@]}

install_packages=(
    "heroic-games-launcher-bin"
)
rpm -q ${install_packages[@]} || rpm-ostree install ${install_packages[@]}

remove_packages=(
    ""
)
rpm -q ${remove_packages[@]} || rpm-ostree uninstall ${remove_packages[@]}

 
wget $(curl -s https://api.github.com/repos/Heroic-Games-Launcher/HeroicGamesLauncher/releases/latest | jq -r '.assets[] | select(.name | contains ("rpm")) | .browser_download_url')

wget -O heroic-latest.rpm $(curl -s https://api.github.com/repos/Heroic-Games-Launcher/HeroicGamesLauncher/releases/latest | jq -r '.assets[] | select(.name | contains ("rpm")) | .browser_download_url')
