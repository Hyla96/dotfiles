source "$HOME/.zsh/shell.zsh"
source "$HOME/.zsh/work.zsh"
source "$HOME/.zsh/personal.zsh"

[[ -f /Users/gabriel.costache/.dart-cli-completion/zsh-config.zsh ]] && . /Users/gabriel.costache/.dart-cli-completion/zsh-config.zsh || true


alias claude-personal="CLAUDE_CONFIG_DIR=~/.claude-personal claude"
