#!/bin/sh

run_as_root() {
    sudo printf ''
}

edit_dnf_config() {
    printf '\nConfiguring DNF...\n\n'
    
    printf 'deltarpm=False\nmax_parallel_downloads=10\ndefaultyes=True\n' | sudo tee -a /etc/dnf/dnf.conf
}

remove_rpms() {
    printf '\nRemoving RPM packages...\n\n'
    
    sudo dnf remove -y gnome-boxes gnome-calculator gnome-calendar gnome-characters cheese gnome-clocks gnome-connections gnome-contacts gnome-disk-utility simple-scan evince mediawriter firefox gnome-font-viewer gnome-color-manager eog libreoffice* gnome-logs gnome-maps gnome-photos rhythmbox gnome-terminal text-editor gnome-tour totem gnome-weather
}

upgrade_rpms() {
    printf '\nUpgrading RPM packages...\n\n'
    
    sudo dnf upgrade -y --refresh
}

install_rpmfusion() {
    printf '\nInstalling RPM Fusion repositories...\n\n'
    
    sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-'$(rpm %fedora)'.noarch.rpm
    sudo dnf install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-'$(rpm %fedora)'.noarch.rpm
    
    sudo dnf groupupdate -y core
}

install_rpms() {
    printf '\nInstalling RPM packages...\n\n'
    
    sudo dnf install -y gstreamer1-plugins-bad-\* gstreamer1-plugins-good-\* gstreamer1-plugins-base gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel
    sudo dnf install -y lame* --exclude=lame-devel
    sudo dnf group upgrade -y --with-optional --allowerasing --skip-broken Multimedia
    sudo dnf install -y ffmpeg ffmpeg-libs libva libva-utils intel-media-driver mozilla-openh264 gnome-shell-extension-pop-shell xprop distrobox gparted @virtualization tlp tlp-rdw gnome-tweaks
    
}

install_flatpaks() {
    printf '\nInstalling flatpaks...\n\n'
    
    flatpak install # 
}

set_gsettings() {
    printf '\nConfiguring GNOME...\n\n'
}

sync_dotfiles() {
    printf '\nSyncing app configurations...\n\n'
}

run_as_root

edit_dnf_config

remove_rpms

upgrade_rpms

#install_rpmfusion

#install_rpms

#install_flatpaks

#set_gsettings

#sync_dotfiles
