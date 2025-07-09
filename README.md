# 🚀 ARCHITECT SCRIPT

[🇫🇷 Passer à la version française](#script-architect-fr)  


A post-install script designed to set up a complete and ready-to-use **Arch Linux system** right after using `archinstall`. Optimized for **gamers**, this script provides modular configuration options, minimal bloat, and performance in mind.

---

> ⚠️ **DISCLAIMER**  
> This script is derived from personal post-install notes and fully suits my hardware and needs. It has been thoroughly tested on my system but **comes with no warranty** for compatibility on your machine.
>
> This is not a distribution. It's a helper to **speed up post-installation**, and its maintenance is your responsibility.
>
> Arch Linux is a **DIY (Do It Yourself)** distribution. It assumes you have technical knowledge or are willing to read the documentation. If you're not self-sufficient, Arch is not for you.
>
> > 📌 From the [Arch Wiki](https://wiki.archlinux.org/title/Arch_Linux):  
> > _"While many GNU/Linux distributions attempt to be more user-friendly, Arch Linux has always been and will remain a user-centric distribution. It is designed for competent GNU/Linux users who are willing to read documentation and solve their own problems."_  
> >
> > Running Arch without reading documentation defeats its purpose.
> > 
> 🧠 **Note:** If you are using an **NVIDIA GPU**, it must be from the **16xx (Turing) series or newer** to use the **`nvidia-open-dkms`** driver (open kernel modules).  
>  
> If you own a **Pascal GTX 10xx** or an **older GPU** (e.g., **Maxwell**, **Kepler**, or earlier such as **GTX 9xx / 8xx / 7xx**), you need the **proprietary driver** instead.  
> In that case, run the following command after the script:
> ```bash
> sudo pacman -S nvidia-dkms
> ```
> When prompted by `pacman`, **replace** `nvidia-open-dkms` with `nvidia-dkms`.
> > ⚠️ **Important information:**  
> [NVIDIA is planning to drop support for its Maxwell, Pascal, and Volta GPUs, along with the legacy proprietary driver](https://www.phoronix.com/news/Maxwell-Pascal-Volta-Legacy-Near).  
> If you're using one of these GPUs, it's strongly recommended to upgrade to a newer graphics card, ideally an **AMD GPU** or a **NVIDIA Turing or newer** model that supports the new open kernel modules (`nvidia-open`).

---

## ⚙️ Installation Command

```bash
sudo pacman -S --needed git base-devel \
  && git clone https://github.com/MrTHP/Architect.git ~/Architect \
  && cd ~/Architect \
  && chmod +x ./architect.sh \
  && ./architect.sh
```

At the end of the script, you can delete the ~/Architect folder.





---

## 🧩 Features Overview

1. **Pacman Setup** — Optimized package manager (parallel downloads, color, etc.)
2. **Shell Aliases** — Fast commands like:
   - `update-arch`
   - `clean-arch`
   - `fix-key`
   - `update-mirrors`
3. **GPU Configuration** — NVIDIA/AMD/Intel setup.
4. **AUR Support** — Install `yay` or `paru`, depending on your preference.
5. **Optional Components** — Printers, Firewall, Bluetooth, Sound, etc.
6. **Extra Software** — Browsers, games, apps, media tools, and more.
7. ## 📦 Software Catalog
<details>
<summary><strong>Desktop & Virtualisation</strong></summary>

| Logiciel | Paquet(s) |
|----------|-----------|
| LibreOffice (EN) | `libreoffice-fresh` |
| LibreOffice (FR) | `libreoffice-fresh libreoffice-fresh-fr` |
| OnlyOffice | `onlyoffice-bin` |
| GitHub Desktop | `github-desktop-bin` |
| Visual Studio Code | `visual-studio-code-bin` |
| VS Code (OSS) | `code` |
| VirtualBox | `virtualbox virtualbox-host-dkms virtualbox-guest-iso` |
| Virt-Manager | `virt-manager virt-viewer dnsmasq vde2 bridge-utils openbsd-netcat dmidecode libguestfs` |
| GNOME Boxes | `gnome-boxes` |
| CrossOver | `crossover` |
| Proton VPN | `proton-vpn-gtk-app` |
| Proton Pass | `proton-pass-bin` |
| qBittorrent | `qbittorrent` |
</details>

<details>
<summary><strong>Audio / Musique</strong></summary>

| Logiciel | Paquet(s) |
|----------|-----------|
| Audacious | `audacious` |
| FreeTube | `freetube-bin` |
| Strawberry | `strawberry` |
| Spotify | `spotify` |
| Audacity | `audacity` |
</details>

<details>
<summary><strong>GNOME Extensions</strong></summary>

| Extension | Paquet |
|-----------|--------|
| Extension Manager | `extension-manager` |
| Arc Menu | `gnome-shell-extension-arc-menu` |
| Caffeine | `gnome-shell-extension-caffeine` |
| Dash to Panel | `gnome-shell-extension-dash-to-panel` |
| Desktop Icons NG | `gnome-shell-extension-desktop-icons-ng` |
| Vitals | `gnome-shell-extension-vitals` |
| Weather O'Clock | `gnome-shell-extension-weather-oclock` |
</details>

<details>
<summary><strong>Communication</strong></summary>

| Logiciel | Paquet(s) |
|----------|-----------|
| Discord | `discord` |
| Telegram | `telegram-desktop` |
| Element (Matrix) | `element-desktop element-web` |
| NeoChat (Matrix) | `neochat` |
| Vesktop | `vesktop-bin` |
| WebCord | `webcord` |
| VenCord | `vencord` |
| Gqrx SDR | `gqrx rtl-sdr` |
</details>

<details>
<summary><strong>Système</strong></summary>

| Outil | Paquet(s) |
|-------|-----------|
| OpenRGB | `openrgb i2c-tools` |
| OpenRazer | `openrazer-daemon libnotify polychromatic` |
| arch-update + Vim | `arch-update vim` |
| Lact (GPU) | `lact` |
| Octopi | `octopi` |
| Ventoy | `ventoy-bin` |
</details>

<details>
<summary><strong>IA / ML</strong></summary>

| Outil | Paquet(s) |
|-------|-----------|
| Ollama (NVIDIA/CUDA) | `ollama ollama-cuda ollama-docs` |
| Ollama (AMD/ROCm) | `ollama ollama-rocm ollama-docs` |
| Pinokio | `pinokio-bin` |
</details>

<details>
<summary><strong>Graphisme</strong></summary>

| Logiciel | Paquet |
|----------|--------|
| GIMP | `gimp` |
| Krita | `krita` |
| Inkscape | `inkscape` |
| Blender | `blender` |
| Upscayl | `upscayl-bin` |
</details>

<details>
<summary><strong>Vidéo</strong></summary>

| Logiciel | Paquet |
|----------|--------|
| DaVinci Resolve | `davinci-resolve` |
| DaVinci Resolve Studio | `davinci-resolve-studio` |
| Kdenlive | `kdenlive` |
| OBS Studio | `obs-studio` |
| VLC | `vlc` |
| MPV | `mpv` |
| Video Downloader | `video-downloader` |
| GPU Screen Recorder | `gpu-screenrecorder` |
| Kazam | `kazam` |
</details>

<details>
<summary><strong>Navigateurs</strong></summary>

| Navigateur | Paquet(s) |
|------------|-----------|
| Firefox (EN) | `firefox` |
| Firefox (FR) | `firefox firefox-i18n-fr` |
| Firefox + uBlock | `firefox-ublock-origin` |
| Brave Stable | `brave-bin` |
| Brave Beta | `brave-beta-bin` |
| LibreWolf | `librewolf-bin` |
| Chromium | `chromium` |
| uBlock Origin (ext) | `ublock-origin` |
| Vivaldi | `vivaldi vivaldi-ffmpeg-codecs` |
| Qutebrowser | `qutebrowser` |
| Google Chrome | `google-chrome` |
| Microsoft Edge | `microsoft-edge-stable-bin` |
| Zen Browser | `zen-browser-bin` |
| Floorp | `floorp-bin` |
| Waterfox | `waterfox` |
| Midori | `midori-bin` |
</details>

<details>
<summary><strong>Gaming</strong></summary>

| Logiciel | Paquet(s) |
|----------|-----------|
| Steam | `steam` |
| Lutris | `lutris wine-staging` |
| Heroic Launcher | `heroic-games-launcher-bin` |
| Prism Launcher | `prismlauncher-qt5 jdk8-openjdk` |
| ProtonUp-Qt | `protonup-qt` |
| GOverlay + MangoHud | `goverlay lib32-mangohud` |
| GameMode | `gamemode lib32-gamemode` |
| ProtonPlus | `protonplus` |
| Proton GE | `proton-ge-custom-bin` |
| PortProton | `portproton` |
| Bottles | `bottles` |
| Ryujinx (Switch) | `ryujinx` |
</details>


---

## 🔗 Resources

- 📖 [ArchWiki](https://wiki.archlinux.org/)
[🧠 Architect Script by MrTHP](https://linktr.ee/mrthp)


---

<a name="script-architect-fr"></a>

# 🚀 SCRIPT ARCHITECT

Un script post-installation pour **Arch Linux**, destiné à configurer rapidement un système propre après `archinstall`. Pensé pour les joueurs recherchant **performance, minimalisme et flexibilité**.

---

> ⚠️ **AVERTISSEMENT**  
> Ce script est tiré de notes personnelles. Il fonctionne parfaitement sur ma machine, mais **n'est garanti sur aucun autre système**.
>
> Ce n'est **pas une distribution**, mais un script pour **gagner du temps après l'installation**. Vous restez responsable de la maintenance de votre système.
>
> Arch Linux est une **distribution DIY**. Il est indispensable de savoir lire la documentation, comprendre ce que vous faites et être autonome en cas de souci.
>
> > 📌 Extrait du [Wiki officiel Arch Linux](https://wiki.archlinux.org/title/Arch_Linux_(Fran%C3%A7ais)) :  
> > _"Tandis que de nombreuses distributions GNU/Linux tentent d’être plus conviviales, Arch Linux a toujours été et restera centrée sur l’utilisateur. Elle est destinée aux utilisateurs compétents ou ayant une mentalité de bricoleur prêt à lire la documentation et à résoudre ses propres problèmes."
> >
> > Être sous Arch sans lire la doc, c’est aller à l’encontre de son principe.
> > 
> 🧠 **Remarque :** Si vous utilisez un **GPU NVIDIA**, il doit appartenir à la série **16xx (Turing) ou plus récente** pour pouvoir utiliser le pilote **`nvidia-open-dkms`** (modules open source du noyau).  
>
> Si vous possédez une carte graphique **Pascal GTX 10xx** ou plus ancienne (par exemple **Maxwell**, **Kepler**, etc. comme les **GTX 9xx / 8xx / 7xx**), vous devez utiliser le **pilote propriétaire** à la place.  
> Dans ce cas, exécutez la commande suivante après le script :
> ```bash
> sudo pacman -S nvidia-dkms
> ```
> Lorsque `pacman` vous le demande, **remplacez** `nvidia-open-dkms` par `nvidia-dkms`.
> > ⚠️ **Info importante :**  
> [NVIDIA prévoit d’abandonner prochainement le support de ses cartes Maxwell, Pascal et Volta ainsi que du pilote entièrement propriétaire](https://www.phoronix.com/news/Maxwell-Pascal-Volta-Legacy-Near).  
> Si vous utilisez l’un de ces GPU, il est fortement recommandé d’envisager une mise à niveau vers une carte plus récente, **de préférence AMD** ou **une NVIDIA Turing ou plus récente** compatible avec les nouveaux pilotes open kernel modules (`nvidia-open`).

---


---

## 🧠 Lancer le Script

```bash
sudo pacman -S --needed git base-devel \
  && git clone https://github.com/MrTHP/Architect.git ~/Architect \
  && cd ~/Architect \
  && chmod +x ./architect.sh \
  && ./architect.sh
```

À la fin du script, vous pouvez supprimer le dossier `~/Architect`.

---

## 🧩 Fonctions Principales

1. **Configurer Pacman** — Amélioration du gestionnaire de paquets.
2. **Ajout d'Aliases** — Commandes utiles :
   - `update-arch`
   - `clean-arch`
   - `fix-key`
   - `update-mirrors`
3. **Configuration GPU** — Support complet pour NVIDIA, AMD, Intel.
4. **Support AUR** — Installe `yay` ou `paru`.
5. **Composants Optionnels** — Imprimantes, Firewall, Bluetooth, Audio, etc.
6. **Installation de Logiciels** — Navigateur, multimédia, développement, .
7. ## 📦 Software Catalog
<details>
<summary><strong>Desktop & Virtualisation</strong></summary>

| Logiciel | Paquet(s) |
|----------|-----------|
| LibreOffice (EN) | `libreoffice-fresh` |
| LibreOffice (FR) | `libreoffice-fresh libreoffice-fresh-fr` |
| OnlyOffice | `onlyoffice-bin` |
| GitHub Desktop | `github-desktop-bin` |
| Visual Studio Code | `visual-studio-code-bin` |
| VS Code (OSS) | `code` |
| VirtualBox | `virtualbox virtualbox-host-dkms virtualbox-guest-iso` |
| Virt-Manager | `virt-manager virt-viewer dnsmasq vde2 bridge-utils openbsd-netcat dmidecode libguestfs` |
| GNOME Boxes | `gnome-boxes` |
| CrossOver | `crossover` |
| Proton VPN | `proton-vpn-gtk-app` |
| Proton Pass | `proton-pass-bin` |
| qBittorrent | `qbittorrent` |
</details>

<details>
<summary><strong>Audio / Musique</strong></summary>

| Logiciel | Paquet(s) |
|----------|-----------|
| Audacious | `audacious` |
| FreeTube | `freetube-bin` |
| Strawberry | `strawberry` |
| Spotify | `spotify` |
| Audacity | `audacity` |
</details>

<details>
<summary><strong>GNOME Extensions</strong></summary>

| Extension | Paquet |
|-----------|--------|
| Extension Manager | `extension-manager` |
| Arc Menu | `gnome-shell-extension-arc-menu` |
| Caffeine | `gnome-shell-extension-caffeine` |
| Dash to Panel | `gnome-shell-extension-dash-to-panel` |
| Desktop Icons NG | `gnome-shell-extension-desktop-icons-ng` |
| Vitals | `gnome-shell-extension-vitals` |
| Weather O'Clock | `gnome-shell-extension-weather-oclock` |
</details>

<details>
<summary><strong>Communication</strong></summary>

| Logiciel | Paquet(s) |
|----------|-----------|
| Discord | `discord` |
| Telegram | `telegram-desktop` |
| Element (Matrix) | `element-desktop element-web` |
| NeoChat (Matrix) | `neochat` |
| Vesktop | `vesktop-bin` |
| WebCord | `webcord` |
| VenCord | `vencord` |
| Gqrx SDR | `gqrx rtl-sdr` |
</details>

<details>
<summary><strong>Système</strong></summary>

| Outil | Paquet(s) |
|-------|-----------|
| OpenRGB | `openrgb i2c-tools` |
| OpenRazer | `openrazer-daemon libnotify polychromatic` |
| arch-update + Vim | `arch-update vim` |
| Lact (GPU) | `lact` |
| Octopi | `octopi` |
| Ventoy | `ventoy-bin` |
</details>

<details>
<summary><strong>IA / ML</strong></summary>

| Outil | Paquet(s) |
|-------|-----------|
| Ollama (NVIDIA/CUDA) | `ollama ollama-cuda ollama-docs` |
| Ollama (AMD/ROCm) | `ollama ollama-rocm ollama-docs` |
| Pinokio | `pinokio-bin` |
</details>

<details>
<summary><strong>Graphisme</strong></summary>

| Logiciel | Paquet |
|----------|--------|
| GIMP | `gimp` |
| Krita | `krita` |
| Inkscape | `inkscape` |
| Blender | `blender` |
| Upscayl | `upscayl-bin` |
</details>

<details>
<summary><strong>Vidéo</strong></summary>

| Logiciel | Paquet |
|----------|--------|
| DaVinci Resolve | `davinci-resolve` |
| DaVinci Resolve Studio | `davinci-resolve-studio` |
| Kdenlive | `kdenlive` |
| OBS Studio | `obs-studio` |
| VLC | `vlc` |
| MPV | `mpv` |
| Video Downloader | `video-downloader` |
| GPU Screen Recorder | `gpu-screenrecorder` |
| Kazam | `kazam` |
</details>

<details>
<summary><strong>Navigateurs</strong></summary>

| Navigateur | Paquet(s) |
|------------|-----------|
| Firefox (EN) | `firefox` |
| Firefox (FR) | `firefox firefox-i18n-fr` |
| Firefox + uBlock | `firefox-ublock-origin` |
| Brave Stable | `brave-bin` |
| Brave Beta | `brave-beta-bin` |
| LibreWolf | `librewolf-bin` |
| Chromium | `chromium` |
| uBlock Origin (ext) | `ublock-origin` |
| Vivaldi | `vivaldi vivaldi-ffmpeg-codecs` |
| Qutebrowser | `qutebrowser` |
| Google Chrome | `google-chrome` |
| Microsoft Edge | `microsoft-edge-stable-bin` |
| Zen Browser | `zen-browser-bin` |
| Floorp | `floorp-bin` |
| Waterfox | `waterfox` |
| Midori | `midori-bin` |
</details>

<details>
<summary><strong>Gaming</strong></summary>

| Logiciel | Paquet(s) |
|----------|-----------|
| Steam | `steam` |
| Lutris | `lutris wine-staging` |
| Heroic Launcher | `heroic-games-launcher-bin` |
| Prism Launcher | `prismlauncher-qt5 jdk8-openjdk` |
| ProtonUp-Qt | `protonup-qt` |
| GOverlay + MangoHud | `goverlay lib32-mangohud` |
| GameMode | `gamemode lib32-gamemode` |
| ProtonPlus | `protonplus` |
| Proton GE | `proton-ge-custom-bin` |
| PortProton | `portproton` |
| Bottles | `bottles` |
| Ryujinx (Switch) | `ryujinx` |
</details>


---

## 🔗 Ressources

- 📖 [ArchWiki](https://wiki.archlinux.org/)
[🧠 Architect Script by MrTHP](https://linktr.ee/mrthp)

---

## 🙏 Remerciements

Merci à l'équipe d'Arch Linux, à la communauté Linux, aux mainteneurs AUR et à tous les contributeurs.
