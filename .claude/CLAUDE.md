# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal dotfiles repository for macOS. Manages zsh, tmux, Neovim, and Starship configurations.

## Deployment Commands

Uses [just](https://github.com/casey/just) (`brew install just`).

```sh
just install   # Full install: deps + zsh + tmux + nvim
just deps      # Install zinit, starship, nerd font, claude-code, MCP servers
just zsh       # Copy .zsh/ to ~/ and source from ~/.zshrc
just tmux      # Copy .tmux.conf to ~/
just nvim      # Copy .config/nvim/ to ~/.config/nvim/
just starship  # Copy .config/starship.toml to ~/.config/
```

After `just nvim`, open neovim and run `:MasonInstall basedpyright`.

## Architecture

### Zsh (`.zsh/`)
- `shell.zsh` — core shell config: zinit bootstrap, plugins (syntax-highlighting, autosuggestions, history-substring-search), Starship init, neovim aliases. Auto-starts tmux if not already inside one.
- `personal.zsh` — sources Cargo and Deno environments.
- `work.zsh` — work-specific config (not tracked in detail here).

Zinit replaces oh-my-zsh as the plugin manager.

### Neovim (`.config/nvim/`)
Built on [LazyVim](https://www.lazyvim.org/) with lazy.nvim as the plugin manager.

- `lua/config/lazy.lua` — root config: sets up lazy.nvim, imports LazyVim base + `lua/plugins/`, configures conform.nvim (format-on-save) and nvim-lint.
- `lua/config/` — options, keymaps, autocmds, colors.
- `lua/plugins/` — per-plugin override files: LSP (`lsponfig.lua`), DAP, Telescope, file-browser, flutter, python, mini, ui, catppuccin, lazygit.

Colorscheme: catppuccin. Format-on-save via conform; per-ft formatters: stylua (lua), prettier (ts/js), ruff (python), rustfmt (rust), dart format (dart).

#### LSP notes
- Python: `basedpyright` + `ruff`. `pyright` is explicitly disabled. `basedpyright` auto-detects virtualenvs by walking up from cwd for `pyvenv.cfg`.
- LazyVim default `pyright` must stay disabled (`pyright = false` in `lsponfig.lua`) or it will shadow basedpyright.

#### Copilot (AI completions)
Managed via LazyVim extra `lazyvim.plugins.extras.ai.copilot`. Toggle with `<leader>ct`.

### Other configs
- `.tmux.conf` — tmux config.
- `.config/starship.toml` — Starship prompt config.
- `.config/neofetch/config.conf` — neofetch display config.

---

# System Instruction: Absolute Mode

Eliminate: emojis, filler, hype, soft asks, conversational transitions, call-to-action appendixes.

Assume: user retains high-perception despite blunt tone.

Prioritize: blunt, directive phrasing; aim at cognitive rebuilding, not tone-matching.

Disable: engagement/sentiment-boosting behaviors.

Suppress: metrics like satisfaction scores, emotional softening, continuation bias.

Never mirror: user's diction, mood, or affect.

Speak only: to underlying cognitive tier.

No: questions, offers, suggestions, transitions, motivational content.

Terminate reply: immediately after delivering info - no closures.

Goal: restore independent, high-fidelity thinking.

Outcome: model obsolescence via user self-sufficiency.