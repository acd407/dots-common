# Zsh选项和插件设置
# 对应fish的fish_plugins和全局设置

# 基本选项
setopt AUTO_CD              # 输入目录名自动cd
setopt AUTO_PUSHD           # cd自动pushd
setopt PUSHD_IGNORE_DUPS    # 忽略重复的pushd
setopt PUSHD_SILENT         # 静默pushd/popd
setopt HIST_VERIFY          # 执行历史命令前验证
setopt SHARE_HISTORY        # 共享历史记录
setopt APPEND_HISTORY       # 追加历史记录
setopt INC_APPEND_HISTORY   # 立即写入历史记录
setopt HIST_IGNORE_DUPS     # 忽略重复命令
setopt HIST_IGNORE_ALL_DUPS # 删除旧重复命令
setopt HIST_FIND_NO_DUPS    # 查找时忽略重复
setopt HIST_SAVE_NO_DUPS    # 保存时忽略重复
setopt HIST_REDUCE_BLANKS   # 删除多余空白

# 历史记录设置
HISTFILE="${ZSH_DATA_DIR:-$HOME/.local/share/zsh}/history"
HISTSIZE=50000
SAVEHIST=100000

# 补全设置
autoload -Uz compinit
compinit -d "${ZSH_CACHE_DIR:-$HOME/.cache/zsh}/zcompdump-${ZSH_VERSION}"

# 补全选项
setopt AUTO_MENU            # 自动显示菜单
setopt COMPLETE_IN_WORD     # 在单词中间补全
setopt ALWAYS_TO_END        # 总是移动到单词末尾
setopt COMPLETEALIASES      # 允许 alias 参与补全

# 目录补全
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*' special-dirs true

# 主配置文件中加载其他配置文件
if [[ -o interactive ]]; then
    # 加载颜色设置
    source "$ZDOTDIR/colors.zsh"
    
    # 加载别名
    source "$ZDOTDIR/aliases.zsh"
    
    # 加载键绑定
    source "$ZDOTDIR/keybindings.zsh"
    
    # 加载函数
    source "$ZDOTDIR/functions.zsh"
    
    # 加载提示符
    source "$ZDOTDIR/prompt.zsh"
    
    # 加载补全函数
    source "$ZDOTDIR/completions.zsh"
fi