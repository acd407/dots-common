# 环境变量和PATH设置
# 对应fish的conf.d/envs.fish和conf.d/modules.fish

# CPU核心数设置
local CPU_COUNT=$(nproc)
export MAKEFLAGS="-j$CPU_COUNT"
export OPENBLAS_NUM_THREADS=$CPU_COUNT
export CMAKE_BUILD_PARALLEL_LEVEL=8

# 禁用zsh默认问候语
export BROWSER="firefox"

# PATH设置
typeset -U path  # 去重PATH

# 添加系统二进制路径
for i in /{usr/{local/,},}{,s}bin; do
    if [[ -d "$i" ]] && [[ ! "$path[@]" =~ "$i" ]]; then
        path=("$i" "$path[@]")
    fi
done

# 交互式shell的PATH设置
if [[ -o interactive ]]; then
    # 用户二进制目录
    if [[ -d "$HOME/.bin" ]]; then
        path=("$HOME/.bin" "$path[@]")
        
        if [[ -d "$HOME/.bin/custom" ]]; then
            path=("$HOME/.bin/custom" "$path[@]")
        fi
        
        if [[ -d "$HOME/.bin/appimage" ]]; then
            path=("$HOME/.bin/appimage" "$path[@]")
        fi
        
        if [[ -n "$SWAYSOCK" ]] && [[ -d "$HOME/.bin/wm" ]]; then
            path=("$HOME/.bin/wm" "$path[@]")
        fi
    fi
    
    if [[ -d "$HOME/.local/bin" ]]; then
        path=("$HOME/.local/bin" "$path[@]")
    fi
    
    # ccache
    if [[ -d "/usr/lib/ccache" ]]; then
        path=("/usr/lib/ccache" "$path[@]")
        
        if [[ -d "/usr/lib/ccache/bin" ]]; then
            path=("/usr/lib/ccache/bin" "$path[@]")
        fi
    fi
fi

# Node.js环境
if command -v npm >/dev/null 2>&1; then
    if [[ -d "$XDG_DATA_HOME/npm/bin" ]]; then
        path=("$XDG_DATA_HOME/npm/bin" "$path[@]")
    fi
    
    if [[ -d "$HOME/node_modules/.bin" ]]; then
        path=("$HOME/node_modules/.bin" "$path[@]")
    fi
fi

# Rust环境
if command -v cargo >/dev/null 2>&1; then
    if [[ -d "$HOME/.cargo/bin" ]]; then
        path=("$HOME/.cargo/bin" "$path[@]")
    fi
    
    export RUSTUP_DIST_SERVER='https://rsproxy.cn'
    export RUSTUP_UPDATE_ROOT='https://rsproxy.cn/rustup'
fi

# Go环境
if command -v go >/dev/null 2>&1; then
    export GOPROXY='https://goproxy.cn'
    export GOPATH="$XDG_DATA_HOME/go"
    path=("$GOPATH/bin" "$path[@]")
fi

# Python环境
export PIP_INDEX_URL=https://pypi.mirrors.ustc.edu.cn/simple
export UV_INDEX_URL=https://pypi.mirrors.ustc.edu.cn/simple
export PYTHONSTARTUP="$XDG_CONFIG_HOME/pythonrc"
export PYTHON_HISTORY="$XDG_STATE_HOME/python_history"

# PNPM
export PNPM_HOME="${HOME}/.local/share/pnpm"
if [[ ! "$path[@]" =~ "$PNPM_HOME" ]]; then
    path=("$PNPM_HOME" "$path[@]")
fi

# LS_COLORS
if command -v vivid >/dev/null 2>&1; then
    export LS_COLORS=$(vivid generate one-dark)
fi

# SSH/GPG代理
if command -v gpgconf >/dev/null 2>&1; then
    unset SSH_AGENT_PID
    export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
fi

if [[ -n "$WAYLAND_DISPLAY" ]]; then
    # 更新TTY信息，让pinentry弹出在正确的位置
    export GPG_TTY=$(tty)
    gpg-connect-agent updatestartuptty /bye >/dev/null
fi

# API密钥
export DASHSCOPE_API_KEY=sk-d64d4b6756c24360ba40adbee5f1b485