# ~/.config/bash/env.sh
#
# Single source of truth for the shell environment.
#
# Sourced by:
#   - ~/.profile   (bash login shell: tty / ssh)
#   - ~/.bashrc    (interactive, non-login bash: terminal inside the session)
#   - $BASH_ENV    (every non-interactive bash: agents, scripts, bg tasks)
#
# Contract:
#   * must be idempotent
#   * must not write to stdout/stderr (it is sourced by $BASH_ENV)
#
# Environment variables that must be visible to non-shell consumers
# (GUI apps, systemd user services, portals, file-manager launches) belong in
# ~/.config/environment.d/, NOT here. This file is shell-scoped.

# --- idempotency guard -------------------------------------------------------
if [ -n "${_PI_ENV_LOADED:-}" ]; then
    return 0 2>/dev/null || exit 0
fi
_PI_ENV_LOADED=1
export _PI_ENV_LOADED

# --- helpers -----------------------------------------------------------------
_path_append() {
    case ":${PATH}:" in
        *":$1:"*) ;;
        *) PATH="${PATH:+${PATH}:}$1" ;;
    esac
}
_path_prepend() {
    case ":${PATH}:" in
        *":$1:"*) ;;
        *) PATH="$1${PATH:+:${PATH}}" ;;
    esac
}

# --- XDG defaults (in case we are sourced outside a systemd session) ---------
: "${XDG_CONFIG_HOME:=${HOME}/.config}"
: "${XDG_CACHE_HOME:=${HOME}/.cache}"
: "${XDG_DATA_HOME:=${HOME}/.local/share}"
: "${XDG_STATE_HOME:=${HOME}/.local/state}"
export XDG_CONFIG_HOME XDG_CACHE_HOME XDG_DATA_HOME XDG_STATE_HOME

# --- PATH --------------------------------------------------------------------
# ccache first so compiler symlinks win over /usr/bin.
_path_prepend /usr/lib/ccache/bin
_path_prepend /usr/lib/ccache

# User tool directories (moved from fish's interactive-only block).
_path_append "${HOME}/.bin"
_path_append "${HOME}/.bin/custom"
[ -n "${WAYLAND_DISPLAY:-}" ] && _path_append "${HOME}/.bin/wm"
_path_append "${HOME}/.local/bin"
_path_append "${XDG_DATA_HOME}/npm/bin"
_path_append "${XDG_DATA_HOME}/pnpm/bin"
[ -d "${HOME}/.cargo/bin" ] && _path_append "${HOME}/.cargo/bin"

# --- build parallelism -------------------------------------------------------
if command -v nproc >/dev/null 2>&1; then
    _nproc=$(nproc)
    MAKEFLAGS="-j${_nproc}"; export MAKEFLAGS
    OPENBLAS_NUM_THREADS="${_nproc}"; export OPENBLAS_NUM_THREADS
    unset _nproc
fi
CMAKE_BUILD_PARALLEL_LEVEL=8; export CMAKE_BUILD_PARALLEL_LEVEL

# --- language / tool mirrors -------------------------------------------------
export RUSTUP_DIST_SERVER='https://rsproxy.cn'
export RUSTUP_UPDATE_ROOT='https://rsproxy.cn/rustup'

export GOPROXY='https://goproxy.cn'
export GOPATH="${XDG_DATA_HOME}/go"
[ -d "${GOPATH}/bin" ] && _path_append "${GOPATH}/bin"

export PIP_INDEX_URL='https://pypi.mirrors.ustc.edu.cn/simple'
export UV_INDEX_URL='https://pypi.mirrors.ustc.edu.cn/simple'
export PYTHONSTARTUP="${XDG_CONFIG_HOME}/pythonrc"
export PYTHON_HISTORY="${XDG_STATE_HOME}/python_history"

# --- homebrew ----------------------------------------------------------------
export HOMEBREW_BREW_GIT_REMOTE='https://mirrors.ustc.edu.cn/brew.git'
export HOMEBREW_BOTTLE_DOMAIN='https://mirrors.ustc.edu.cn/homebrew-bottles'
export HOMEBREW_API_DOMAIN='https://mirrors.ustc.edu.cn/homebrew-bottles/api'
if [ -x /home/linuxbrew/.linuxbrew/bin/brew ]; then
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# --- editor ------------------------------------------------------------------
if command -v nvim >/dev/null 2>&1; then
    export EDITOR=nvim
    export MANPAGER='nvim +Man!'
elif command -v vim >/dev/null 2>&1; then
    export EDITOR=vim
elif command -v vi >/dev/null 2>&1; then
    export EDITOR=vi
fi

# --- pi background tasks -----------------------------------------------------
# Belt-and-suspenders: pin the bash dialect even if $SHELL is stale.
export PI_BG_POSIX_SHELL=bash

# --- node version manager (nvm-sh) -------------------------------------------
: "${NVM_DIR:=${XDG_DATA_HOME}/nvm}"
export NVM_DIR
if [ -s "${NVM_DIR}/nvm.sh" ]; then
    # _PI_ENV_LOADED already limits this to once per process tree.
    . "${NVM_DIR}/nvm.sh"
fi

# --- secrets -----------------------------------------------------------------
[ -r "${HOME}/.config/bash/secrets.sh" ] && . "${HOME}/.config/bash/secrets.sh"

# --- cleanup -----------------------------------------------------------------
unset -f _path_append _path_prepend 2>/dev/null || true
