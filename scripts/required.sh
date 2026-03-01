
#THE STUFF THAT I LIKE AND USE


#!/usr/bin/env bash
set -e

echo "Starting required tools & languages installation..."

#Rust
if ! command -v rustc &>/dev/null; then
    echo "Installing Rust..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    source $HOME/.cargo/env
else
    echo "Rust already installed"
fi

#Go
if ! command -v go &>/dev/null; then
    echo "Installing Go..."
    GO_VERSION=1.22.3
    wget https://go.dev/dl/go${GO_VERSION}.linux-amd64.tar.gz -O /tmp/go.tar.gz
    sudo rm -rf /usr/local/go
    sudo tar -C /usr/local -xzf /tmp/go.tar.gz
    export PATH=$PATH:/usr/local/go/bin
else
    echo "Go already installed"
fi

#C toolchain
echo "Installing GCC, Clang, and other build tools..."
sudo pacman -S --needed base-devel clang llvm --noconfirm

#Node / Bun / pnpm
if ! command -v bun &>/dev/null; then
    echo "Installing Bun..."
    curl -fsSL https://bun.sh/install | bash
else
    echo "Bun already installed"
fi

if ! command -v pnpm &>/dev/null; then
    echo "Installing pnpm..."
    corepack enable
else
    echo "pnpm already installed"
fi

#Python
if ! command -v python3 &>/dev/null; then
    echo "Installing Python..."
    sudo pacman -S python python-pip --noconfirm
else
    echo "Python already installed"
fi

#Neovim
if ! command -v nvim &>/dev/null; then
    echo "Installing Neovim..."
    sudo pacman -S neovim --noconfirm
else
    echo "Neovim already installed"
fi

# -----------------------------
# Optional: other tools
# -----------------------------
echo "Installing other useful cool tools that I like..."
sudo pacman -S --needed fzf tmux git ripgrep wget curl --noconfirm

echo "Good to go"

