#!/bin/bash

set -ouex pipefail

curl -o /etc/yum.repos.d/_copr_mesa-git.repo "https://copr.fedorainfracloud.org/coprs/xxmitsu/mesa-git/repo/fedora-rawhide/xxmitsu-mesa-git-fedora-rawhide.repo?arch=x86_64"

repo=(
    "copr:copr.fedorainfracloud.org:xxmitsu:mesa-git"
)

mesa_packages=(
    "mesa-filesystem"
    "mesa-libgbm"
    "mesa-libglapi"
    "mesa-dri-drivers"
    "mesa-libEGL"
    "mesa-libGL"
    "mesa-vulkan-drivers"
    "mesa-va-drivers"
)

rpm-ostree override replace --experimental --from repo=${repo[@]} ${mesa_packages[@]}
