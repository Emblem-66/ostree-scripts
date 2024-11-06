#!/bin/bash

set -ouex pipefail

systemctl enable rpm-ostreed-automatic.timer
systemctl enable flatpak-update.service
systemctl enable flatpak-update.timer
systemctl enable dconf-update.service
systemctl enable flatpak-add-flathub-repo.service
