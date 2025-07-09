#!/usr/bin/env bash
# =============================================================================
# Software installation script with automatic configuration if needed
# =============================================================================

# Load shared functions
source src/cmd.sh

# ---------------------------------------------------------------------------
# Déclarations globales
# ---------------------------------------------------------------------------
declare -A desktop_list
declare -A system_list
declare -A browser_list
declare -A video_list
declare -A picture_list
declare -A gaming_list
declare -A audio_list
declare -A gnome_extensions_list
declare -A ai_list
declare -A communication_list      # ← nouveau

# Will store the complete list of packages to install
selected_packages=""

# ---------------------------------------------------------------------------
# Définition des listes logicielles
# ---------------------------------------------------------------------------

set_software_list() {

    # --- Bureautique & virtualisation --------------------------------------
    desktop_list=(
        ["LibreOffice (EN)"]="libreoffice-fresh"
        ["LibreOffice (FR)"]="libreoffice-fresh libreoffice-fresh-fr"
        ["OnlyOffice"]="onlyoffice-bin"
        ["GitHub Desktop"]="github-desktop-bin"
        ["Visual Studio Code"]="visual-studio-code-bin"
        ["VS Code (OSS)"]="code"
        ["VirtualBox"]="virtualbox virtualbox-host-dkms virtualbox-guest-iso"
        ["Virt-Manager"]="virt-manager virt-viewer dnsmasq vde2 bridge-utils openbsd-netcat dmidecode libguestfs"
        ["GNOME Boxes"]="gnome-boxes"
        ["CrossOver"]="crossover"
        ["Proton VPN"]="proton-vpn-gtk-app"
        ["Proton Pass"]="proton-pass-bin"
        ["qBittorrent"]="qbittorrent"
    )

    # --- Audio / musique ----------------------------------------------------
    audio_list=(
        ["Audacious"]="audacious"
        ["FreeTube"]="freetube-bin"
        ["Strawberry"]="strawberry"
        ["Spotify"]="spotify"
        ["Audacity"]="audacity"
    )

    # --- Extensions GNOME ---------------------------------------------------
    gnome_extensions_list=(
        ["Extension Manager"]="extension-manager"
        ["Arc Menu"]="gnome-shell-extension-arc-menu"
        ["Caffeine"]="gnome-shell-extension-caffeine"
        ["Dash to Panel"]="gnome-shell-extension-dash-to-panel"
        ["Desktop Icons NG"]="gnome-shell-extension-desktop-icons-ng"
        ["Vitals"]="gnome-shell-extension-vitals"
        ["Weather O'Clock"]="gnome-shell-extension-weather-oclock"
    )

    # --- Communication ------------------------------------------------------
    communication_list=(
        ["Discord"]="discord"
        ["Telegram"]="telegram-desktop"
        ["Element (Matrix)"]="element-desktop element-web"
        ["NeoChat (Matrix)"]="neochat"
        ["Vesktop"]="vesktop-bin"
        ["WebCord"]="webcord"
        ["VenCord"]="vencord"
        ["Gqrx SDR"]="gqrx rtl-sdr"
    )

    # --- Outils système -----------------------------------------------------
    system_list=(
        ["OpenRGB"]="openrgb i2c-tools"
        ["OpenRazer"]="openrazer-daemon libnotify polychromatic"
        ["arch-update + Vim"]="arch-update vim"
        ["Lact (GPU)"]="lact"
        ["Octopi"]="octopi"
        ["Ventoy"]="ventoy-bin"
    )

    # --- IA -----------------------------------------------------------------
    ai_list=(
        ["Ollama (NVIDIA/CUDA)"]="ollama ollama-cuda ollama-docs"
        ["Ollama (AMD/ROCm)"]="ollama ollama-rocm ollama-docs"
        ["Pinokio"]="pinokio-bin"
    )

    # --- Graphisme ----------------------------------------------------------
    picture_list=(
        ["GIMP"]="gimp"
        ["Krita"]="krita"
        ["Inkscape"]="inkscape"
        ["Blender"]="blender"
        ["Upscayl"]="upscayl-bin"
    )

    # --- Vidéo --------------------------------------------------------------
    video_list=(
        ["DaVinci Resolve"]="davinci-resolve"
        ["DaVinci Resolve Studio"]="davinci-resolve-studio"
        ["Kdenlive"]="kdenlive"
        ["OBS Studio"]="obs-studio"
        ["VLC"]="vlc"
        ["MPV"]="mpv"
        ["Video Downloader"]="video-downloader"
        ["GPU Screen Recorder"]="gpu-screen-recorder"
        ["Kazam"]="kazam"
    )

    # --- Navigateurs --------------------------------------------------------
    browser_list=(
        ["Firefox (EN)"]="firefox"
        ["Firefox (FR)"]="firefox firefox-i18n-fr"
        ["Firefox + uBlock"]="firefox-ublock-origin"
        ["Brave Stable"]="brave-bin"
        ["Brave Beta"]="brave-beta-bin"
        ["LibreWolf"]="librewolf-bin"
        ["Chromium"]="chromium"
        ["uBlock Origin (ext)"]="ublock-origin"
        ["Vivaldi"]="vivaldi vivaldi-ffmpeg-codecs"
        ["Qutebrowser"]="qutebrowser"
        ["Google Chrome"]="google-chrome"
        ["Microsoft Edge"]="microsoft-edge-stable-bin"
        ["Zen Browser"]="zen-browser-bin"
        ["Floorp"]="floorp-bin"
        ["Waterfox"]="waterfox"
        ["Midori"]="midori-bin"
    )

    # --- Gaming -------------------------------------------------------------
    gaming_list=(
        ["Steam"]="steam"
        ["Lutris"]="lutris wine-staging"
        ["Heroic Launcher"]="heroic-games-launcher-bin"
        ["Prism Launcher"]="prismlauncher-qt5 jdk8-openjdk"
        ["ProtonUp-Qt"]="protonup-qt"
        ["GOverlay + MangoHud"]="goverlay lib32-mangohud"
        ["GameMode"]="gamemode lib32-gamemode"
        ["ProtonPlus"]="protonplus"
        ["Proton GE"]="proton-ge-custom-bin"
        ["PortProton"]="portproton"
        ["Bottles"]="bottles"
        ["Ryujinx (Switch)"]="ryujinx"
    )
}

# ---------------------------------------------------------------------------
# Affichage et sélection
# ---------------------------------------------------------------------------
function select_and_install() {
    declare -n software_list=$1
    local -r software_type=$2
    local i=1
    local options=()
    local input

    eval_gettext "\${GREEN}\${software_type}\${RESET} :"; echo
    for software in "${!software_list[@]}"; do
        printf " ${PURPLE}%2d${RESET}) %s\n" "$i" "$software"
        options+=("$software")
        ((i++))
    done

    eval_gettext "\${BLUE}::\${RESET} Packages to install (e.g., 1 2 3, 1-3, all or press enter to skip): "
    read -ra input

    for item in "${input[@]}"; do
        if [[ "$item" == "$(eval_gettext "all")" ]]; then
            for software in "${!software_list[@]}"; do
                selected_packages+=" ${software_list[$software]} "
            done
            break
        elif [[ $item =~ ^[0-9]+$ ]]; then
            selected_packages+=" ${software_list[${options[$item - 1]}]} "
        elif [[ $item =~ ^[0-9]+-[0-9]+$ ]]; then
            IFS='-' read -ra range <<<"$item"
            for ((j = ${range[0]}; j <= ${range[1]}; j++)); do
                selected_packages+=" ${software_list[${options[$j - 1]}]} "
            done
        fi
    done
}

# ---------------------------------------------------------------------------
# Main
# ---------------------------------------------------------------------------
function install_software() {
    # 1. Init lists
    set_software_list

    # 2. Sélection
    select_and_install browser_list          "$(eval_gettext "Browsers")"
    select_and_install system_list           "$(eval_gettext "System Software")"
    select_and_install desktop_list          "$(eval_gettext "Desktop Apps")"
    select_and_install audio_list            "$(eval_gettext "Audio / Music")"
    select_and_install gnome_extensions_list "$(eval_gettext "GNOME Extensions")"
    select_and_install communication_list    "$(eval_gettext "Communication")"
    select_and_install video_list            "$(eval_gettext "Video Software")"
    select_and_install picture_list          "$(eval_gettext "Image Editors")"
    select_and_install ai_list               "$(eval_gettext "AI Tools")"
    select_and_install gaming_list           "$(eval_gettext "Gaming Software")"

    # 3. Installation
    local -r packages="${selected_packages}"
    selected_packages=""
    install_lst "${packages}" "aur"

    # 4. Post-install actions
    # (identiques à ta version ; aucune modif ci-dessous)

    # Arch Update
    if [[ "${packages}" =~ "arch-update" ]]; then
        exec_log "systemctl --user enable arch-update.timer" "$(eval_gettext "Enable arch-update.timer")"
        exec_log "arch-update --tray --enable"               "$(eval_gettext "Enable arch-update tray")"
    fi

    # Open Razer
    if [[ "${packages}" =~ "openrazer-daemon" ]]; then
        exec_log "sudo usermod -aG plugdev $(whoami)" "$(eval_gettext "Add the current user to the plugdev group")"
    fi

    # VirtualBox
    if [[ "${packages}" =~ "virtualbox" ]]; then
        exec_log "sudo usermod -aG vboxusers $(whoami)" "$(eval_gettext "Add the current user to the vboxusers group")"
        exec_log "sudo systemctl enable vboxweb.service"    "$(eval_gettext "Enable vboxweb")"
    fi

    # Virt-Manager
    if [[ "${packages}" =~ "virt-manager" ]]; then
        exec_log "sudo usermod -aG libvirt $(whoami)" "$(eval_gettext "Add the current user to the libvirt group")"
        exec_log "sudo usermod -aG kvm $(whoami)"     "$(eval_gettext "Add the current user to the kvm group")"
        exec_log "sudo systemctl enable --now libvirtd"     "$(eval_gettext "Enable libvirtd")"

        sudo sed -i 's/#unix_sock_group = "libvirt"/unix_sock_group = "libvirt"/' /etc/libvirt/libvirtd.conf
        sudo sed -i 's/#unix_sock_rw_perms = "0770"/unix_sock_rw_perms = "0770"/' /etc/libvirt/libvirtd.conf

        if command -v firewall-cmd >/dev/null 2>&1; then
            sudo firewall-cmd --permanent --add-service=libvirt &>/dev/null
            sudo firewall-cmd --permanent --add-port=5900-5999/tcp &>/dev/null
            sudo firewall-cmd --permanent --add-port=16509/tcp &>/dev/null
            sudo firewall-cmd --permanent --add-port=5666/tcp &>/dev/null
            sudo firewall-cmd --reload &>/dev/null
        fi

        if command -v ufw >/dev/null 2>&1; then
            sudo ufw allow 5900:5999/tcp
            sudo ufw allow 16509/tcp
            sudo ufw allow 5666/tcp
            sudo ufw reload &>/dev/null
        fi
    fi

    # Gamemode
    if [[ "${packages}" =~ "gamemode" ]]; then
        exec_log "sudo usermod -aG gamemode $(whoami)" "$(eval_gettext "Add the current user to the gamemode group")"

        if [[ ! -f /etc/gamemode.ini ]]; then
            cat <<'EOF' | sudo tee /etc/gamemode.ini >/dev/null
[general]
reaper_freq=5
desiredgov=performance
igpu_desiredgov=powersave
igpu_power_threshold=0.3
softrealtime=off
renice=0
ioprio=0
inhibit_screensaver=1
disable_splitlock=1

[filter]
;whitelist=RiseOfTheTombRaider
;blacklist=HalfLife3

[gpu]
;apply_gpu_optimisations=0
;gpu_device=0
;nv_powermizer_mode=1
;nv_core_clock_mhz_offset=0
;nv_mem_clock_mhz_offset=0
;amd_performance_level=high

[cpu]
;park_cores=no
;pin_cores=yes

[supervisor]
;supervisor_whitelist=
;supervisor_blacklist=
;require_supervisor=0

[custom]
;start=notify-send "GameMode started"
;end=notify-send "GameMode ended"
;script_timeout=10
EOF
        fi
    fi

    # 5. Ports Steam (firewalld / ufw) — inchangé
    if [[ "${packages}" =~ "steam" ]]; then
        if command -v firewall-cmd >/dev/null 2>&1; then
            sudo firewall-cmd --permanent --add-port={80,443}/tcp &>/dev/null
            sudo firewall-cmd --permanent --add-port=27015-27050/{tcp,udp} &>/dev/null
            sudo firewall-cmd --permanent --add-port=27000-27100/udp &>/dev/null
            sudo firewall-cmd --permanent --add-port=27031-27036/udp &>/dev/null
            sudo firewall-cmd --permanent --add-port=27036/tcp &>/dev/null
            sudo firewall-cmd --permanent --add-port=4380/udp &>/dev/null
            sudo firewall-cmd --permanent --add-port=3478/udp &>/dev/null
            sudo firewall-cmd --permanent --add-port=4379/udp &>/dev/null
            sudo firewall-cmd --permanent --add-port=4380/udp &>/dev/null
            sudo firewall-cmd --permanent --add-port=27014-27030/udp &>/dev/null
            sudo firewall-cmd --reload &>/dev/null
        fi

        if command -v ufw >/dev/null 2>&1; then
            sudo ufw allow 80,443/tcp
            sudo ufw allow 27015:27050/tcp
            sudo ufw allow 27015:27050/udp
            sudo ufw allow 27000:27100/udp
            sudo ufw allow 27031:27036/udp
            sudo ufw allow 27036/tcp
            sudo ufw allow 4380/udp
            sudo ufw allow 3478,4379,4380/udp
            sudo ufw allow 27014:27030/udp
            sudo ufw reload &>/dev/null
        fi
    fi
}

# Lancer l'installation si ce script est appelé directement
[[ "${BASH_SOURCE[0]}" == "$0" ]] && install_software "$@"
