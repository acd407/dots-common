# 自定义提示符
# 对应fish的functions/fish_prompt.fish

# 设置提示符颜色
setopt PROMPT_SUBST
autoload -Uz vcs_info

# 配置vcs_info
zstyle ':vcs_info:*' enable git svn hg
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr '%F{yellow}+%f'
zstyle ':vcs_info:*' unstagedstr '%F{red}*%f'
zstyle ':vcs_info:*' formats ' %F{066}%b%f%F{yellow}%c%f%F{red}%u%f'
zstyle ':vcs_info:*' actionformats ' %F{066}%b|%a%f%F{yellow}%c%f%F{red}%u%f'

# 更新vcs_info
precmd() {
    vcs_info
}

# 主提示符函数
function custom_prompt() {
    local last_status=$?
    local color_user="%F{112}"
    local color_host="%F{110}"
    local color_cwd="%F{178}"
    local color_time="%F{139}"
    local color_normal="%f"
    local color_status="%F{196}"
    
    # 根据终端颜色支持调整
    if [[ $TERM == "linux" ]]; then
        color_user="%F{2}"
        color_host="%F{4}"
        color_cwd="%F{3}"
        color_time="%F{5}"
    fi
    
    # 根据用户权限调整
    local suffix="$"
    if [[ $EUID -eq 0 ]]; then
        suffix="#"
        color_cwd="%F{196}"
    fi
    
    # 错误状态显示
    local prompt_status=""
    if [[ $last_status -ne 0 ]]; then
        prompt_status=" ${color_status}[${last_status}]${color_normal}"
    fi
    
    # 构建提示符
    local prompt="${color_user}%n${color_normal}@${color_host}%m${color_normal}"
    prompt+=" ${color_time}%D{%T}${color_normal}"
    prompt+=" ${color_cwd}%~${color_normal}"
    prompt+="${vcs_info_msg_0_}${prompt_status}"
    prompt+="\n${suffix} "
    
    echo -n "$prompt"
}

# 设置提示符
PROMPT='$(custom_prompt)'