GREEN="\033[0;32m"
NC="\033[0m"

function run_as_root {
    sudo echo
}

function edit_dnf_config {
    echo "Configuring DNF..."
    
    echo "gpgcheck=True" | sudo tee /etc/dnf/dnf.conf
    echo "skip_if_unavailable=True" | sudo tee -a /etc/dnf/dnf.conf
    echo "deltarpm=False" | sudo tee -a /etc/dnf/dnf.conf
    echo "fastest_mirror=" | sudo tee -a /etc/dnf/dnf.conf
    echo "max_parallel_downloads=20" | sudo tee -a /etc/dnf/dnf.conf
    echo "timeout=15" | sudo tee -a /etc/dnf/dnf.conf
}

function remove_rpms {
    echo "Removing RPM packages..."
    
    sudo dnf remove -y gnome-boxes gnome-calculator gnome-calendar gnome-characters cheese gnome-clocks gnome-connections gnome-contacts gnome-disk-utility simple-scan evince mediawriter firefox gnome-font-viewer gnome-color-manager eog libreoffice* gnome-logs gnome-maps gnome-photos rhythmbox gnome-terminal text-editor gnome-tour totem gnome-weather
}

function upgrade_rpms {
    echo "Upgrading DNF packages..."
    
    sudo dnf update -y --refresh
}

function install_rpmfusion {
    echo "Installing RPM Fusion repositories..."
    
    sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
    
    sudo dnf install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
}

function install_rpms {
    echo "Installing DNF packages..."
    
    sudo dnf install -y gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav
    / --exclude=gstreamer1-plugins-bad-free-devel
    
    sudo dnf install -y distrobox @virtualization dnf-dragora
}

function install_flatpaks {
    echo "Installing flatpaks..."
    
    flatpak install # 
}

function set_gsettings {
    echo "Configuring GNOME..."
}

function sync_dotfiles {
    echo "Syncing app configurations..."
}

run_as_root

edit_dnf_config

remove_rpms

upgrade_rpms

install_rpmfusion

install_rpms

install_flatpaks

set_gsettings

sync_dotfiles
