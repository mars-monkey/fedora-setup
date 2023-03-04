function run_as_root {
    sudo echo
}

function edit_dnf_config {
    echo "Enabling parallel downloads in DNF..."
    
    sudo echo -e "max_parallel_downloads=10" >> /etc/dnf/dnf.conf
}

function remove_packages {
    echo "Removing DNF packages..."
    
    sudo dnf remove -y evince firefox libreoffice-writer libreoffice-calc libreoffice-draw libreoffice-math libreoffice-impress
    # Add more packages here
}

function upgrade_dnf_packages {
    echo "Upgrading DNF packages..."
    
    sudo dnf update -y --refresh
}

function install_rpmfusion {
    echo "Installing RPM Fusion repositories..."
    
    sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
    
    sudo dnf install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
}

function install_dnf_packages {
    echo "Installing DNF packages..."
    
    sudo dnf install -y gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav
    / --exclude=gstreamer1-plugins-bad-free-devel
    
    sudo dnf install -y distrobox @virtualization dnf-dragora
}

function unfiltered_flathub {
    echo "Removing Flathub filter..."
    
    sudo flatpak remote-delete flathub
    
    sudo flatpak remote-add flathub https://flathub.org/repo/flathub.flatpakrepo
}

function install_flatpaks {
    echo "Installing flatpaks..."
    
    flatpak install # 
}

run_as_root

edit_dnf_config

remove_packages

upgrade_dnf_packages

install_rpmfusion

install_dnf_packages

unfiltered_flathub

install_flatpaks

set_gsettings

sync_dotfiles
