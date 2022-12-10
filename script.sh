function check_internet_connection {
    curl https://github.com/starship-boi/fedora-setup/test
}

check_internet_connection

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
