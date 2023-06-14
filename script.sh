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
    # sudo dnf install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-'$(rpm %fedora)'.noarch.rpm
    
    sudo dnf groupupdate -y core
}

install_rpms() {
    printf '\nInstalling RPM packages...\n\n'
    
    # Install media codecs
    sudo dnf install gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel
    sudo dnf install lame\* --exclude=lame-devel
    sudo dnf group upgrade --with-optional Multimedia
    
    sudo dnf install -y distrobox gparted @virtualization gnome-tweaks tldr intel-media-driver ffmpeg-free libavcodec-freeworld
    
}

install_flatpaks() {
    printf '\nInstalling flatpaks...\n\n'
    
    flatpak install com.brave.Browser org.videolan.VLC com.valvesoftware.Steam com.mattjakeman.ExtensionManager com.github.tchx84.Flatseal com.usebottles.bottles com.obsproject.Studio us.zoom.Zoom org.gimp.GIMP org.libreoffice.LibreOffice org.onlyoffice.desktopeditors io.gitlab.librewolf-community com.bitwarden.desktop com.protonvpn.www org.prismlauncher.PrismLauncher org.gnome.Logs org.gnome.font-viewer org.gnome.TextEditor org.gnome.Evince org.gnome.Maps org.gnome.Calculator org.gnome.Clocks tv.kodi.Kodi org.gnome.Connections org.gnome.Characters io.bassi.Amberol org.gnome.SoundRecorder com.raggesilver.BlackBox io.github.shiftey.Desktop com.nextcloud.desktopclient.nextcloud cc.arduino.IDE2 org.nickvision.TubeConverter com.github.iwalton3.jellyfin-media-player org.raspberrypi.rpi-imager org.geogebra.GeoGebra com.gitlab.newsflash io.github.spacingbat3.webcord org.gnome.World.PikaBackup io.github.realmazharhussain.GdmSettings com.github.rafostar.Clapper org.gnome.Loupe io.gitlab.zehkira.Monophony org.gnome.SimpleScan flatpak run org.gnome.Snapshot ca.desrt.dconf-editor org.gnome.Solanum com.github.maoschanz.drawing app.drey.Dialect org.tenacityaudio.Tenacity org.ferdium.Ferdium org.jitsi.jitsi-meet org.pitivi.Pitivi io.gitlab.adhami3310.Impression io.github.Foldex.AdwSteamGtk nl.hjdskes.gcolor3 org.gnome.Chess dev.geopjr.Collision org.nickvision.money com.lunarclient.LunarClient org.gaphor.Gaphor ir.imansalmani.IPlan com.belmoussaoui.Obfuscate org.gnome.World.Secrets com.github.liferooter.textpieces org.gabmus.whatip com.github.vladimiry.ElectronMail org.nickvision.tagger com.chatterino.chatterino app.drey.EarTag app.drey.Damask org.gnome.Mines org.gnome.gitlab.cheywood.Iotas org.gnome.Sudoku com.github.taiko2k.avvie org.gnome.PowerStats com.hunterwittenborn.Celeste org.gnome.ColorViewer
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
