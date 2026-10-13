# 自定义函数
# 对应fish/functions/目录中的函数

# 其他实用函数
function erc() {
    if [[ -n "$1" ]]; then
        $EDITOR "$HOME/.config/zsh/$1"
    else
        $EDITOR "$HOME/.config/zsh/.zshrc"
    fi
}

function fs() {
    local ip=$(command ip route | grep default | awk '{print $(NF-2)}' | head -n 1)
    local url="http://$ip:4780"
    qr "$url"
    python3 -m http.server --bind "$ip" "$@"
}

function lsblk() {
    command lsblk -o PATH,TYPE,FSTYPE,FSUSE%,SIZE,MOUNTPOINTS "$@"
}

function p6d() {
    ping -n 2400:3200::1 "$@"
}

function pbd() {
    ping -n 36.152.44.96 "$@"
}

function pp() {
    local gateway_ip=$(command ip route | grep default | awk '{print $3}' | head -n 1)
    ping -n $gateway_ip "$@"
}

function ssho() {
    ssh -o StrictHostKeyChecking=no "$@"
}

function tk {
    if [[ -n "$1" ]]; then
        $EDITOR $HOME/.config/tk/$1
    else
        $EDITOR $HOME/.config/tk.txt
    fi
}

function trans {
    if [[ $# -eq 0 ]]; then
        echo "用法: trans <要翻译的文本>"
        return 1
    fi

    local text="$*"
    
    # 简单检测：是否只包含ASCII可打印字符（不包括中文等）
    if [[ "$text" =~ '^[[:print:]]*$' ]]; then
        command trans :zh "$text"
    else
        command trans :en "$text"
    fi
}

function venv {
    local VENV_PATH=$HOME/.local/share/venv
    
    if [[ -z "$1" ]]; then
        source $VENV_PATH/main/bin/activate
    else
        source $VENV_PATH/$1/bin/activate
    fi
}

function wshowkeys {
    command wshowkeys -t 1 -a bottom -b '#00000000' -f '#ffffffff' -F 'SauceCodePro Nerd Font Mono 30' $@
}

format_storage_units() {
    local bytes=$1
    local units="KMGTPE"
    local unit_idx=0   # 1=K, 2=M, 3=G, ...

    # 确保最小单位为 K
    while (( (bytes >= 1000 && unit_idx < 6) || unit_idx == 0 )); do
        bytes=$(printf "%.6f" "$(echo "$bytes / 1024" | bc -l)")
        ((unit_idx++))
    done

    local unit=${units:$((unit_idx-1)):1}

    # 动态选择格式并输出
    if (( $(echo "$bytes >= 100" | bc -l) )); then
        printf " %3.0f%s\n" "$(printf "%.0f" "$bytes")" "$unit"
    elif (( $(echo "$bytes >= 10" | bc -l) )); then
        printf "%4.1f%s\n" "$bytes" "$unit"
    else
        printf "%4.2f%s\n" "$bytes" "$unit"
    fi
}

function xray {
    case "$1" in
        "statistics")
            local up=$(xray api stats -name "outbound>>>proxy>>>traffic>>>uplink" | jq '.stat.value')
            if [[ "$up" != "null" ]]; then
                echo -en "Upload:   "
                format_storage_units $up
            fi
            
            local down=$(xray api stats -name "outbound>>>proxy>>>traffic>>>downlink" | jq '.stat.value')
            if [[ "$down" != "null" ]]; then
                echo -en "Download: "
                format_storage_units $down
            fi
            ;;
        "status")
            local rule="fwmark 0x20 lookup 100 pre 32765"
            case "$2" in
                "up")
                    doas sh -c "ip rule add $rule; ip -6 rule add $rule"
                    ;;
                "down")
                    doas sh -c "ip rule del $rule; ip -6 rule del $rule"
                    ;;
                *)
                    sh -c "{ ip rule; ip -6 rule; } | grep \"fwmark 0x20\""
                    ;;
            esac
            ;;
        *)
            command xray $@
            ;;
    esac
}
