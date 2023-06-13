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
    
    sudo dnf remove -y gnome-boxes gnome-calculator gnome-calendar gnome-characters cheese gnome-clocks gnome-connections gnome-contacts gnome-disk-utility simple-scan evince mediawriter firefox gnome-font-viewer gnome-color-manager eog libreoffice* gnome-logs gnome-maps gnome-photos rhythmbox text-editor gnome-tour totem gnome-weather
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
    
    sudo dnf install -y distrobox gparted @virtualization gnome-tweaks tldr
    
}

install_flatpaks() {
    printf '\nInstalling flatpaks...\n\n'
    
    flatpak install com.brave.Browser org.videolan.VLC com.valvesoftware.Steam com.mattjakeman.ExtensionManager com.github.tchx84.Flatseal com.usebottles.bottles com.obsproject.Studio us.zoom.Zoom org.gimp.GIMP org.libreoffice.LibreOffice org.onlyoffice.desktopeditors io.gitlab.librewolf-community com.bitwarden.desktop com.protonvpn.www org.prismlauncher.PrismLauncher
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

install_rpmfusion

install_rpms

install_flatpaks

#set_gsettings

#sync_dotfiles
