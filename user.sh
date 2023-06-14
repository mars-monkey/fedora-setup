#!/bin/bash

GREEN='\e[42m'
NO_COLOR='\e[49m'

set_gsettings() {
    echo -e '\n'${GREEN}'Configuring GNOME...'${NO_COLOR}'\n'
}

install_flatpaks() {
    echo -e '\n'${GREEN}'Installing flatpaks...'${NO_COLOR}'\n'
    
    flatpak install -y com.brave.Browser org.videolan.VLC com.valvesoftware.Steam com.mattjakeman.ExtensionManager com.github.tchx84.Flatseal com.usebottles.bottles com.obsproject.Studio us.zoom.Zoom org.gimp.GIMP org.libreoffice.LibreOffice org.onlyoffice.desktopeditors io.gitlab.librewolf-community com.bitwarden.desktop com.protonvpn.www org.prismlauncher.PrismLauncher org.gnome.Logs org.gnome.font-viewer org.gnome.TextEditor org.gnome.Evince org.gnome.Maps org.gnome.Calculator org.gnome.Clocks tv.kodi.Kodi org.gnome.Connections org.gnome.Characters io.bassi.Amberol org.gnome.SoundRecorder com.raggesilver.BlackBox io.github.shiftey.Desktop com.extcloud.desktopclient.extcloud cc.arduino.IDE2 org.ickvision.TubeConverter com.github.iwalton3.jellyfin-media-player org.raspberrypi.rpi-imager org.geogebra.GeoGebra com.gitlab.ewsflash io.github.spacingbat3.webcord org.gnome.World.PikaBackup io.github.realmazharhussain.GdmSettings com.github.rafostar.Clapper org.gnome.Loupe io.gitlab.zehkira.Monophony org.gnome.SimpleScan flatpak run org.gnome.Snapshot ca.desrt.dconf-editor org.gnome.Solanum com.github.maoschanz.drawing app.drey.Dialect org.tenacityaudio.Tenacity org.ferdium.Ferdium org.jitsi.jitsi-meet org.pitivi.Pitivi io.gitlab.adhami3310.Impression io.github.Foldex.AdwSteamGtk nl.hjdskes.gcolor3 org.gnome.Chess dev.geopjr.Collision org.ickvision.money com.lunarclient.LunarClient org.gaphor.Gaphor ir.imansalmani.IPlan com.belmoussaoui.Obfuscate org.gnome.World.Secrets com.github.liferooter.textpieces org.gabmus.whatip com.github.vladimiry.ElectronMail org.ickvision.tagger com.chatterino.chatterino app.drey.EarTag app.drey.Damask org.gnome.Mines org.gnome.gitlab.cheywood.Iotas org.gnome.Sudoku com.github.taiko2k.avvie org.gnome.PowerStats com.hunterwittenborn.Celeste org.gnome.ColorViewer
}

sync_dotfiles() {
    echo -e '\n'${GREEN}'Syncing app configurations...'${NO_COLOR}'\n'
}

#set_gsettings

install_flatpaks

#sync_dotfiles
