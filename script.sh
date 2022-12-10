function check_internet_connection {
    if [ $(curl https://github.com/starship-boi/fedora-setup/test.txt) == "Yay, it works!" ]
    then
        echo "You are connected to the Internet."
    else
        echo "You are not connected to the Internet: aborting..."
        
        exit 3
    fi
}

function check_sudo {
    if [ $(id -u) != "0" ]
    then
        echo "This script must be run using root permissions (for example with 'sudo'): aborting..."
    fi
}

function edit_dnf_config {
    sudo echo -e "fastestmirror=True \nmax_parallel_downloads=10 \ndeltarpm=-2 \ndeltarpm_percentage=99" >> /etc/dnf/dnf.conf
}

function remove_packages {
    sudo dnf remove -y evince firefox
}

function upgrade_dnf_packages {
    sudo dnf update -y --refresh
    
    
}

check_internet_connection

check_sudo

edit_dnf_config

remove_packages

upgrade_dnf_packages

check_new_release

if new_release == true {
    perform_sysupgrade
}

install_rpmfusion

install_dnf_packages

unfiltered_flathub

install_flatpaks

set_gsettings

sync_dotfiles
