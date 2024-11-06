#!/bin/bash

set -ouex pipefail

systemctl enable rpm-ostreed-automatic.timer

cat <<EOF | sudo tee /etc/systemd/system/flatpak-update.service > /dev/null
[Unit]
Description=Update Flatpaks
[Service]
Type=oneshot
ExecStart=/usr/bin/flatpak update -y
[Install]
WantedBy=default.target
EOF
systemctl enable flatpak-update.service

cat <<EOF | sudo tee /etc/systemd/system/flatpak-update.timer > /dev/null
[Unit]
Description=Update Flatpaks
[Timer]
OnCalendar=*:0/4
Persistent=true
[Install]
WantedBy=timers.target
EOF
systemctl enable flatpak-update.timer

