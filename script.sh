GREEN="\033[0;32m"
NC="\033[0m"

function run_as_root {
    sudo echo
}

function edit_dnf_config {
    echo -e "${GREEN}Configuring DNF..."
    
    echo "gpgcheck=True" | sudo tee /etc/dnf/dnf.conf
    echo "skip_if_unavailable=True" | sudo tee -a /etc/dnf/dnf.conf
    echo "deltarpm=False" | sudo tee -a /etc/dnf/dnf.conf
    echo "fastest_mirror=" | sudo tee -a /etc/dnf/dnf.conf
    echo "max_parallel_downloads=20" | sudo tee -a /etc/dnf/dnf.conf
    echo "timeout=15" | sudo tee -a /etc/dnf/dnf.conf
}

function remove_rpms {
    echo -e "${GREEN}Removing RPM packages..."
    
    sudo dnf remove -y gnome-boxes gnome-calculator gnome-calendar gnome-characters cheese gnome-clocks gnome-connections gnome-contacts gnome-disk-utility simple-scan evince mediawriter firefox gnome-font-viewer gnome-color-manager eog libreoffice* gnome-logs gnome-maps gnome-photos rhythmbox gnome-terminal text-editor gnome-tour totem gnome-weather
}

function upgrade_rpms {
    echo -e "${GREEN}Upgrading DNF packages..."
    
    sudo dnf update -y --refresh
}

function install_rpmfusion {
    echo -e "${GREEN}Installing RPM Fusion repositories..."
    
    sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
    sudo dnf install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
    
    sudo dnf groupupdate -y core
}

function install_rpms {
    echo -e "${GREEN}Installing DNF packages..."
    
    sudo dnf install -y gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel
    sudo dnf install -y lame* --exclude=lame-devel
    sudo dnf group upgrade -y --with-optional Multimedia
    
    sudo dnf install -y distrobox @virtualization
}

function install_flatpaks {
    echo -e "${GREEN}Installing flatpaks..."
    
    flatpak install # 
}

function set_gsettings {
    echo -e "${GREEN}Configuring GNOME..."
}

function sync_dotfiles {
    echo -e "${GREEN}Syncing app configurations..."
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
