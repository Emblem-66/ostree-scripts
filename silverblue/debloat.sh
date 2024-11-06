#!/bin/bash

set -ouex pipefail

remove_packages=(
    "toolbox"
    "firefox"
    "firefox-langpacks"
    "gnome-classic-session"
    "gnome-shell-extension-window-list"
    "gnome-shell-extension-background-logo"
    "gnome-shell-extension-launch-new-instance"
    "gnome-shell-extension-apps-menu"
    "gnome-shell-extension-places-menu"
    "gnome-tour"
    "yelp"
    "yelp-libs"
    "yelp-xsl"
)

rpm -q ${remove_packages[@]} || rpm-ostree uninstall ${remove_packages[@]}

