# 键绑定设置
# 对应fish的conf.d/bind.fish

if [[ -o interactive ]]; then
    # 单词删除配置
    function backward-kill-short-word() {
        local old_wordchars="$WORDCHARS"
        WORDCHARS=''
        zle backward-kill-word
        WORDCHARS="$old_wordchars"
    }
    zle -N backward-kill-short-word

    # 向后移动短单词（忽略标点符号）
    function backward-short-word() {
        WORDCHARS='' zle backward-word
    }
    zle -N backward-short-word

    # 向前移动短单词（忽略标点符号）
    function forward-short-word() {
        WORDCHARS='' zle forward-word
    }
    zle -N forward-short-word

    typeset -ga ZSH_AUTOSUGGEST_PARTIAL_ACCEPT_WIDGETS
    ZSH_AUTOSUGGEST_PARTIAL_ACCEPT_WIDGETS+=(
        forward-short-word
    )

    # 基本编辑键绑定
    bindkey '^A' beginning-of-line
    bindkey '^E' end-of-line
    
    # 编辑命令缓冲区
    autoload -U edit-command-line
    zle -N edit-command-line
    bindkey '^O' edit-command-line
    bindkey '^[v' edit-command-line
    
    # 单词操作
    bindkey '^W' backward-kill-word # Ctrl-w 删除长单词
    bindkey '^[[1;5C' forward-word  # Ctrl+Right
    bindkey '^[[1;5D' backward-word # Ctrl+Left
    
    # 历史搜索
    bindkey '^R' history-incremental-search-backward
    bindkey '^S' history-incremental-search-forward
    
    # 清屏并重绘
    bindkey '^[[1;6L' clear-screen # Ctrl+Shift+L
    
    # Alt键绑定
    bindkey '^[^?' backward-kill-short-word    # Alt+Backspace
    bindkey '^[[3;3~' backward-kill-short-word # 备用序列
    bindkey '^[[1;3D' backward-short-word      # Alt+Left
    bindkey '^[[1;3C' forward-short-word       # Alt+Right
fi
