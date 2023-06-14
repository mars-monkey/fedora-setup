#!/bin/bash

GREEN='\e[42m'
NO_COLOR='\e[49m'

disable_selinux() {
    echo -e '\n'${GREEN}'Disabling SELinux...'${NO_COLOR}'\n'
}

edit_dnf_config() {
    echo -e '\n'${GREEN}'Configuring DNF...'${NO_COLOR}'\n'
    
    echo -e 'deltarpm=False\nmax_parallel_downloads=10\ndefaultyes=True\n' | tee -a /etc/dnf/dnf.conf
}

remove_rpms() {
    echo -e '\n'${GREEN}'Removing RPM packages...'${NO_COLOR}'\n'
    
    dnf remove -y gnome-boxes gnome-calculator gnome-calendar gnome-characters cheese gnome-clocks gnome-connections gnome-contacts gnome-disk-utility simple-scan evince mediawriter firefox gnome-font-viewer gnome-color-manager eog libreoffice* gnome-logs gnome-maps gnome-photos rhythmbox text-editor gnome-tour totem gnome-weather
}

upgrade_rpms() {
    echo -e '\n'${GREEN}'Upgrading RPM packages...'${NO_COLOR}'\n'
    
    dnf upgrade -y --refresh
}

install_rpmfusion() {
    echo -e '\n'${GREEN}'Installing RPM Fusion repositories...'${NO_COLOR}'\n'
    
    dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-'$(rpm %fedora)'.oarch.rpm
    # dnf install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-'$(rpm %fedora)'.oarch.rpm
    
    dnf groupupdate -y core
}

install_rpms() {
    echo -e '\n'${GREEN}'Installing RPM packages...'${NO_COLOR}'\n'
    
    # Install media codecs
    dnf install -y gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel
    dnf install -y lame\* --exclude=lame-devel
    dnf group upgrade -y --with-optional Multimedia
    
    dnf install -y btrfs-assistant gnome-tweaks gnome-shell-extension-pop-shell gparted neofetch tldr ffmpeg-free intel-media-driver libavcodec-freeworld
    
}

#disable_selinux

edit_dnf_config

remove_rpms

upgrade_rpms

install_rpmfusion

install_rpms
