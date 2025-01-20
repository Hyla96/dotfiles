#!/bin/bash

echo "Starting ZSH environment setup..."

# Install Zinit
echo "Installing Zinit..."
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Install Nerd Font (useful for Starship symbols)
echo "Installing Nerd Font..."
brew install --cask font-cousine-nerd-font

# Install Starship
echo "Installing Starship..."
if command -v brew &> /dev/null; then
    brew install starship
else
    curl -sS https://starship.rs/install.sh | sh
fi

# Create default Starship config if it doesn't exist
if [ ! -f ~/.config/starship.toml ]; then
    mkdir -p ~/.config
    echo "# Get started with a basic starship.toml
format = \"\$all\"
" > ~/.config/starship.toml
fi

echo "Setup complete! Please restart your terminal and ensure your terminal uses the JetBrains Mono Nerd Font."