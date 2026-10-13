# 颜色主题设置
# 对应fish的conf.d/colors.fish

# 基本颜色设置
autoload -U colors
colors

# LS_COLORS
if command -v vivid >/dev/null 2>&1; then
    export LS_COLORS=$(vivid generate one-dark)
fi

# Zsh颜色设置
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=244'
export ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor root)

# 命令高亮颜色
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[command]='fg=110'
ZSH_HIGHLIGHT_STYLES[alias]='fg=110'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=110'
ZSH_HIGHLIGHT_STYLES[function]='fg=110'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=004'
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=196'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=004'
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=004'
ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=004'
ZSH_HIGHLIGHT_STYLES[path]='fg=066'
ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=066'
ZSH_HIGHLIGHT_STYLES[globbing]='fg=033'
ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=white'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=004'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=004'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='fg=220'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=220'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=220'
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=004'
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=004'
ZSH_HIGHLIGHT_STYLES[assign]='fg=004'

# 补全颜色
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'
zstyle ':completion:*' menu select

# 历史搜索颜色
zstyle ':history-search:*' highlight-current true