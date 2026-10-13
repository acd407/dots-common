# Zsh主配置文件
# 相当于fish的config.fish

zmodload zsh/zprof

# 加载选项和插件设置
source "$ZDOTDIR/options.zsh"

# 登录会话时导入/etc/profile中的环境变量
if [[ -o login ]]; then
    source /etc/profile
fi

# Foot终端的命令输出处理
function foot_cmd_start {
    echo -en "\e]133;C\e\\"
}

function foot_cmd_end {
    echo -en "\e]133;D\e\\"
}

# 设置preexec和precmd函数
autoload -Uz add-zsh-hook
add-zsh-hook preexec foot_cmd_start
add-zsh-hook precmd foot_cmd_end

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

if [[ "$PROFILE_STARTUP" == true ]]; then
    zprof
fi
