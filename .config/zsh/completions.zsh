# Zsh补全函数
# 对应fish的complete命令

# tk函数的补全
_tk() {
    local -a configs
    configs=($(find "$HOME/.config/tk/" -type f 2>/dev/null | sed "s|$HOME/.config/tk/||"))
    
    _describe 'tk configs' configs
}

# erc函数的补全
_erc() {
    local -a configs
    configs=($(find "$HOME/.config/zsh/" -type f 2>/dev/null | sed "s|$HOME/.config/zsh/||"))
    
    _describe 'zsh configs' configs
}

# venv函数的补全
_venv() {
    local -a venvs
    venvs=($(find "$HOME/.local/share/venv/" -maxdepth 1 -type d 2>/dev/null | sed "s|$HOME/.local/share/venv/||" | grep -v "^$"))
    
    _describe 'virtual environments' venvs
}

# 注册补全函数
compdef _tk tk
compdef _erc erc
compdef _venv venv
