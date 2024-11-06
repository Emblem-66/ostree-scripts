#!/bin/bash

set -ouex pipefail

rpmfusion=(
    "https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm"
    "https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm"
)
rpm -q rpmfusion-free-release rpmfusion-nonfree-release || rpm-ostree install ${rpmfusion[@]}

install_packages=(
    "ffmpeg"
	"gstreamer1-plugin-libav"
	"gstreamer1-plugins-bad-free-extras"
	"gstreamer1-plugins-bad-freeworld"
	"gstreamer1-plugins-ugly"
	"gstreamer1-vaapi"
    "libavcodec-freeworld"
)

remove_packages=(
    "noopenh264"
    "ffmpeg-free"
	"libavcodec-free"
	"libavdevice-free"
	"libavfilter-free"
	"libavformat-free"
	"libavutil-free"
	"libpostproc-free"
	"libswresample-free"
	"libswscale-free"
)

rpm-ostree uninstall ${remove_packages[@]}
rpm-ostree install ${install_packages[@]}


