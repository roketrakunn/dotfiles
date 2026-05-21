#!/usr/bin/env bash
set -e

echo "Starting Roketrakun Ultimate Dev Setup..."

#Backup and safety
BACKUP_DIR="$HOME/dotfiles_backup_ultimate_$(date +%Y%m%d%H%M%S)"
mkdir -p "$BACKUP_DIR"
echo "Backup folder (just in case) created at $BACKUP_DIR"

#Install languages and tools(comment this out if you already ran the scrip below)
bash ~/dotfiles/scripts/required.sh  # Reuse the regular install script

#Fonts for Kitty & Waybar
echo "Installing Nerd Fonts..."
NFDIR="$HOME/.local/share/fonts"
mkdir -p "$NFDIR"
cd "$NFDIR"
wget -q https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.zip -O JetBrainsMono.zip
unzip -o JetBrainsMono.zip
fc-cache -fv
cd -

#Hyprland extra modules
echo "Installing Hyprland extras..."
sudo pacman -S waybar swaylock swaybg swayidle mako grim slurp wl-clipboard  --noconfirm

#Reload dotfiles & services
echo "Reloading Tmux, Zsh, and Waybar..."
# Tmux
tmux source-file ~/.config/tmux/tmux.conf || echo "No tmux session yet"
# Zsh
#exec zsh
# Waybar
#pkill -f waybar || true
#waybar &

#personal scripts
echo "Linking dotfiles scripts..."
mkdir -p ~/.local/scripts
ln -sf ~/dotfiles/scripts/* ~/.local/scripts/

echo "Done...now write some code"

