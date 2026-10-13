# 别名设置
# 对应fish的conf.d/abbreviations.fish

if [[ -o interactive ]]; then
    # 基本别名
    alias ls='ls --color -h'
    alias l='ls'
    alias ll='ls -l'
    alias la='ls -la'
    alias sp='speak'
    alias sc='systemctl'
    alias scu='systemctl --user'
    alias pc='pkg-config --cflags --libs'
    alias df='df -Th -x tmpfs'
    alias img='chafa'
    alias yz='yazi'
    alias ping='ping -n'
    alias base16='xxd -ps'
    alias tlmgr='tlmgr --usermode'
    alias ni='niri-session'
    function relock() {
        env $(cat /proc/(pidof swayidle)/environ | tr '\0' '\n' | rg '^(SWAYSOCK|WAYLAND_DISPLAY)') ~/.bin/wm/lock
    }
    alias pkui='pkexec env WAYLAND_DISPLAY=$WAYLAND_DISPLAY XDG_RUNTIME_DIR=$XDG_RUNTIME_DIR QT_QPA_PLATFORM=wayland'
    function reload_ec() {
        sudo sh -c 'modprobe -r cros_ec_lpcs cros_ec_keyb cros_ec_typec && sleep 1 && modprobe cros_ec_lpcs && modprobe cros_ec_keyb && modprobe cros_ec_typec'
    }
    alias prepare_suspend="sudo ectool --interface=lpc hostsleepstate freeze"

    # 条件别名
    if ! command -v arp >/dev/null 2>&1; then
        alias arp='cat /proc/net/arp'
    fi
    
    if ! command -v paru >/dev/null 2>&1 && command -v pacman >/dev/null 2>&1; then
        alias paru=pacman
    fi

    # 查找最佳可用编辑器
    local real_editor=""
    if command -v vi >/dev/null 2>&1; then
        if [[ -L "$(which vi)" ]]; then
            real_editor=$(basename "$(readlink "$(which vi)")")
        else
            real_editor="vi"
        fi
    else
        for e in nvim vim vis; do
            if command -v "$e" >/dev/null 2>&1; then
                real_editor="$e"
                break
            fi
        done
    fi

    # 设置编辑器和manpager
    if [[ -n "$real_editor" ]]; then
        case "$real_editor" in
            nvim)
                export EDITOR=nvim
                export MANPAGER='nvim +Man!'
                ;;
            *)
                export EDITOR="$real_editor"
                ;;
        esac
        alias vi="$EDITOR"
    fi
fi
