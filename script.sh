#!/bin/bash

GREEN='\x1b[42m'

run_as_root() {
    sudo -s
}

edit_dnf_config() {
    echo -e '\$(GREEN)\nConfiguring DNF...\n'
    
    echo -e 'deltarpm=False\nmax_parallel_downloads=10\ndefaultyes=True\n' | sudo tee -a /etc/dnf/dnf.conf
}

remove_rpms() {
    echo -e '\nRemoving RPM packages...\n'
    
    dnf remove -y gnome-boxes gnome-calculator gnome-calendar gnome-characters cheese gnome-clocks gnome-connections gnome-contacts gnome-disk-utility simple-scan evince mediawriter firefox gnome-font-viewer gnome-color-manager eog libreoffice* gnome-logs gnome-maps gnome-photos rhythmbox text-editor gnome-tour totem gnome-weather
}

upgrade_rpms() {
    echo -e '\nUpgrading RPM packages...\n'
    
    dnf upgrade -y --refresh
}

install_rpmfusion() {
    echo -e '\nInstalling RPM Fusion repositories...\n'
    
    dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-'$(rpm %fedora)'.oarch.rpm
    # dnf install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-'$(rpm %fedora)'.oarch.rpm
    
    dnf groupupdate -y core
}

install_rpms() {
    echo -e '\nInstalling RPM packages...\n'
    
    # Install media codecs
    dnf install -y gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel
    dnf install -y lame\* --exclude=lame-devel
    dnf group upgrade -y --with-optional Multimedia
    
    dnf install -y distrobox gparted @virtualization gnome-tweaks tldr intel-media-driver ffmpeg-free libavcodec-freeworld
    
}

disable_selinux() {
    echo -e '\nDisabling SELinux...\n'
}

exit_root() {
    
}

set_gsettings() {
    echo -e '\nConfiguring GNOME...\n'
}

install_flatpaks() {
    echo -e '\nInstalling flatpaks...\n'
    
    flatpak install -y com.brave.Browser org.videolan.VLC com.valvesoftware.Steam com.mattjakeman.ExtensionManager com.github.tchx84.Flatseal com.usebottles.bottles com.obsproject.Studio us.zoom.Zoom org.gimp.GIMP org.libreoffice.LibreOffice org.onlyoffice.desktopeditors io.gitlab.librewolf-community com.bitwarden.desktop com.protonvpn.www org.prismlauncher.PrismLauncher org.gnome.Logs org.gnome.font-viewer org.gnome.TextEditor org.gnome.Evince org.gnome.Maps org.gnome.Calculator org.gnome.Clocks tv.kodi.Kodi org.gnome.Connections org.gnome.Characters io.bassi.Amberol org.gnome.SoundRecorder com.raggesilver.BlackBox io.github.shiftey.Desktop com.extcloud.desktopclient.extcloud cc.arduino.IDE2 org.ickvision.TubeConverter com.github.iwalton3.jellyfin-media-player org.raspberrypi.rpi-imager org.geogebra.GeoGebra com.gitlab.ewsflash io.github.spacingbat3.webcord org.gnome.World.PikaBackup io.github.realmazharhussain.GdmSettings com.github.rafostar.Clapper org.gnome.Loupe io.gitlab.zehkira.Monophony org.gnome.SimpleScan flatpak run org.gnome.Snapshot ca.desrt.dconf-editor org.gnome.Solanum com.github.maoschanz.drawing app.drey.Dialect org.tenacityaudio.Tenacity org.ferdium.Ferdium org.jitsi.jitsi-meet org.pitivi.Pitivi io.gitlab.adhami3310.Impression io.github.Foldex.AdwSteamGtk nl.hjdskes.gcolor3 org.gnome.Chess dev.geopjr.Collision org.ickvision.money com.lunarclient.LunarClient org.gaphor.Gaphor ir.imansalmani.IPlan com.belmoussaoui.Obfuscate org.gnome.World.Secrets com.github.liferooter.textpieces org.gabmus.whatip com.github.vladimiry.ElectronMail org.ickvision.tagger com.chatterino.chatterino app.drey.EarTag app.drey.Damask org.gnome.Mines org.gnome.gitlab.cheywood.Iotas org.gnome.Sudoku com.github.taiko2k.avvie org.gnome.PowerStats com.hunterwittenborn.Celeste org.gnome.ColorViewer
}

sync_dotfiles() {
    echo -e '\nSyncing app configurations...\n'
}

run_as_root

edit_dnf_config

remove_rpms

upgrade_rpms

install_rpmfusion

install_rpms

install_flatpaks

set_gsettings

disable_selinux

sync_dotfiles
