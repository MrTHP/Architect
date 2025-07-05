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

---

## 🔗 Ressources

- 📖 [ArchWiki](https://wiki.archlinux.org/)
[🧠 Architect Script by MrTHP](https://linktr.ee/mrthp)

---

## 🙏 Remerciements

Merci à l'équipe d'Arch Linux, à la communauté Linux, aux mainteneurs AUR et à tous les contributeurs.
