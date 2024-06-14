# TIRSO dotfiles

Script to prepare your GNU/Linux terminal (WSL also) in a «superterminal» with modern, autocompleted commands and other features.

## Includes

- **Shell**: ZSH + OH-MY-ZSH + Agnoster theme
- **Plugins**: Zgen plugin manager + History & Red/green completion commands
- **Essentials tools**: wget + git + make + cmake + g++
- **CLI Editors**: vim + nano + micro
- **CLI tools**: ccze + jq + nnn
- **API/Request tools**: curl + http + googler + ddgr
- **Help/Info**: man + tldr + neofetch
- **Fun**: sl + lolcat + wipeclean + cmatrix
- **Compressors/conversors**: unzip + zip + bzip2 + p7zip + svgo + ttf2woff + woff2 + ffmpeg
- **Language + Package Managers**: Go + Rust + Deno + Node/NVM/PNPM
- **Containers**: Docker

| **Modern commands** |
|-|
| bat (cat) |
| exa (ls, tree) |
| glow (cat .md) |
| jless (cat .json) |
| catimg (image cat) |
| duf (df) |
| ncdu (du) |
| zoxide (cd) |
| htop (top) |
| icdiff (diff) |
| zellij (tmux) |
| hyperfine (time) |

## Requisites

If you haven't a non-root user with sudo privileges, create it before run this script:

```bash
sudo usermod -aG sudo usuario
sudo apt-get install git chrome-gnome-shell gnome-shell-extensions gnome-tweaks
sudo apt-get update -y && sudo apt-get upgrade
```

## Installation

```bash
git clone https://github.com/tirso25/dotfiles ~/.dotfiles
cd ~/.dotfiles
bash install.sh
bash fondo.sh
bash temas.sh
bash programas.sh
```

* Note: Do not run as root/sudo this file!
