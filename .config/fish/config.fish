# ~/.config/fish/config.fish -- 该文件最后执行（在 conf.d/ 之后）
#
# fish 只保留交互 UI；环境变量在 ~/.config/bash/env.sh。

# --- foot / OSC-133 shell integration ---------------------------------------
function foot_cmd_start --on-event fish_preexec
    echo -en "\e]133;C\e\\"
end

function foot_cmd_end --on-event fish_postexec
    echo -en "\e]133;D\e\\"
end

# --- interactive settings ----------------------------------------------------
if status is-interactive
    # history（TTY 下关闭）
    if test "$TERM" = linux
        set -g fish_history tty
        set -g fish_history_size 0
        set -g fish_history_path /dev/null
    else
        set -g fish_history fish
        set -g fish_history_size 50000
        set -g fish_history_max_size 100000
    end

    # colorized ls
    if command -v --quiet vivid
        set -gx LS_COLORS (vivid generate one-dark)
    end
end

# no greeting
set -g fish_greeting
