#!/bin/bash

echo "Starting ZSH environment setup..."

# Install Zinit
echo "Installing Zinit..."
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Install Nerd Font for Powerlevel10k
echo "Installing Nerd Font..."
if command -v brew &> /dev/null; then
    brew install --cask font-meslo-lg-nerd-font
else
    # Create fonts directory if it doesn't exist
    mkdir -p ~/.local/share/fonts

    # Download and install Meslo Nerd Font
    echo "Downloading Meslo Nerd Font..."
    curl -fLo ~/.local/share/fonts/MesloLGS%20NF%20Regular.ttf \
        https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf

    # Refresh font cache
    if command -v fc-cache &> /dev/null; then
        fc-cache -f -v
    fi
fi
