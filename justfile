set shell := ["zsh", "-euo", "pipefail", "-c"]

DOTFILES := justfile_directory()

# Install everything from scratch
install: deps zsh tmux nvim

# Install all dependencies (zinit, starship, nerd font, claude-code, MCP servers)
deps:
    @echo "Installing dependencies..."
    # Zinit
    #!/usr/bin/env zsh
    ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
    if [ ! -d "$ZINIT_HOME" ]; then
        mkdir -p "$(dirname $ZINIT_HOME)"
        git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
    fi
    # Starship + Nerd Font
    brew install starship
    brew install --cask font-cousine-nerd-font
    # Claude Code + MCP servers
    brew install claude-code
    claude mcp add --transport sse context7 https://mcp.context7.com/sse
    claude mcp add sequential-thinking -s local -- npx -y @modelcontextprotocol/server-sequential-thinking
    claude mcp add serena -- uvx --from git+https://github.com/oraios/serena serena start-mcp-server --context ide-assistant --project $(pwd)

# Copy zsh config to ~/
zsh:
    @echo "Installing zsh config..."
    cp -r {{DOTFILES}}/.zsh ~/
    @grep -q 'source ~/.zsh/shell.zsh' ~/.zshrc 2>/dev/null || echo '\nsource ~/.zsh/shell.zsh' >> ~/.zshrc
    @grep -q 'source ~/.zsh/personal.zsh' ~/.zshrc 2>/dev/null || echo 'source ~/.zsh/personal.zsh' >> ~/.zshrc
    @grep -q 'source ~/.zsh/work.zsh' ~/.zshrc 2>/dev/null || echo 'source ~/.zsh/work.zsh' >> ~/.zshrc
    @echo "Restart your terminal to apply zsh changes."

# Copy tmux config to ~/
tmux:
    @echo "Installing tmux config..."
    cp {{DOTFILES}}/.tmux.conf ~/

# Copy neovim config to ~/.config/nvim/
nvim:
    @echo "Installing neovim config..."
    mkdir -p ~/.config
    cp -r {{DOTFILES}}/.config/nvim/ ~/.config/nvim/
    @echo "Open nvim and run :Codeium Auth to authenticate Windsurf."

# Copy starship config to ~/.config/
starship:
    @echo "Installing starship config..."
    mkdir -p ~/.config
    cp {{DOTFILES}}/.config/starship.toml ~/.config/starship.toml
