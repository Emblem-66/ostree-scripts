#!/bin/bash

set -ouex pipefail

curl -o /etc/yum.repos.d/_copr_kernel-chachyos.repo "https://copr.fedorainfracloud.org/coprs/bieszczaders/kernel-cachyos/repo/fedora-rawhide/bieszczaders-kernel-cachyos.repo"

setsebool -P domain_kernel_load_modules on
#dnf install -y kernel-cachyos kernel-cachyos-devel-matched
#rpm-ostree install --force-replacefiles kernel-cachyos kernel-cachyos-devel-matched
#rpm-ostree override remove kernel kernel-core kernel-modules kernel-modules-core kernel-modules-extra --install kernel-cachyos

rpmfusion=(
    "https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm"
    "https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm"
)
#rpm -q rpmfusion-free-release rpmfusion-nonfree-release || rpm-ostree install ${rpmfusion[@]}

install_packages=(
    "kernel-cachyos"
)
#rpm -q ${install_packages[@]} || rpm-ostree install ${install_packages[@]}

remove_packages=(
    "kernel"
    "kernel-core"
    "kernel-modules"
    "kernel-modules-core"
    "kernel-modules-extra"
)
#rpm -q ${remove_packages[@]} || rpm-ostree uninstall ${remove_packages[@]}

#rpm-ostree override remove kernel kernel-core kernel-modules kernel-modules-core kernel-modules-extra --install kernel-cachyos

rpm-ostree override remove ${remove_packages[@]} --install ${install_packages[@]}
