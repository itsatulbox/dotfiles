# ----------------------------
# ZSH Options
# ----------------------------
setopt append_history
setopt share_history
setopt hist_ignore_dups
setopt no_beep

HISTFILE=~/.zsh_history
HISTSIZE=32768
SAVEHIST=32768
# ----------------------------
# Zsh Completion
# ----------------------------
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' select-prompt '%SScrolling active: %p%s'

# ----------------------------
# Starship prompt
# ----------------------------
if command -v starship &> /dev/null; then
    eval "$(starship init zsh)"
fi

# ----------------------------
# History Substring Search
# ----------------------------
HISTORY_SEARCH="/usr/share/zsh/plugins/zsh-history-substring-search"
if [[ -f "$HISTORY_SEARCH/zsh-history-substring-search.zsh" ]]; then
    source "$HISTORY_SEARCH/zsh-history-substring-search.zsh"
    bindkey '^[[A' history-substring-search-up
    bindkey '^[[B' history-substring-search-down
fi

# ----------------------------
# FZF
# ----------------------------
FZF_PATH="/usr/share/fzf"
if [[ -f "$FZF_PATH/shell/key-bindings.zsh" ]]; then
    source "$FZF_PATH/shell/key-bindings.zsh"
fi
if [[ -f "$FZF_PATH/shell/completion.zsh" ]]; then
    source "$FZF_PATH/shell/completion.zsh"
fi
bindkey '^R' fzf-history-widget


