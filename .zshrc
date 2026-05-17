source "$HOME/.zsh/shell.zsh"
source "$HOME/.zsh/work.zsh"
source "$HOME/.zsh/personal.zsh"

. "$HOME/.local/bin/env"

. "$HOME/.cargo/env"
. "/Users/gabriel.costache/.deno/env"
## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f /Users/gabriel.costache/.dart-cli-completion/zsh-config.zsh ]] && . /Users/gabriel.costache/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]

alias claude-personal="CLAUDE_CONFIG_DIR=~/.claude-personal claude"
alias docker=podman
export DOCKER=podman
