#!/bin/bash

set -ouex pipefail

url="https://raw.githubusercontent.com/Emblem-66/ostree-scripts/refs/heads/main/"

scripts=(
"general/services.sh"
"general/kernel-cachyos.sh"
"general/mesa-git.sh"
"general/codecs.sh"
"general/fonts.sh"
"general/steam.sh"
"general/heroic.sh"
"general/bottles.sh"
"general/prismlauncher.sh"
"general/goverlay.sh"
"general/onlyoffice.sh"
)

#bash <(curl -s ${url}${scripts[@]})

bash <(curl -s https://raw.githubusercontent.com/Emblem-66/ostree-scripts/refs/heads/main/general/services.sh)
bash <(curl -s https://raw.githubusercontent.com/Emblem-66/ostree-scripts/refs/heads/main/general/kernel-cachyos.sh)
bash <(curl -s https://raw.githubusercontent.com/Emblem-66/ostree-scripts/refs/heads/main/general/mesa-git.sh)
bash <(curl -s https://raw.githubusercontent.com/Emblem-66/ostree-scripts/refs/heads/main/general/codecs.sh)