if status is-interactive
    abbr -a -- l ls
    abbr -a -- sp speak
    abbr -a -- sc systemctl
    abbr -a -- scu 'systemctl --user'
    abbr -a -- pc 'pkg-config --cflags --libs'
    abbr -a -- df 'df -Th -x tmpfs'
    abbr -a -- img chafa
    abbr -a -- yz yazi
    abbr -a -- ping 'ping -n'
    abbr -a -- pbd 'ping -n 36.152.44.96'
    abbr -a -- p6d 'ping -n 2400:3200::1'
    abbr -a -- pp "ping -n (command ip -j route | jq -r '.[] | select(.dst == \"default\") | .gateway')"
    abbr -a -- base16 'xxd -ps'
    abbr -a -- flatpak 'flatpak --user'
    abbr -a -- tlmgr 'tlmgr --usermode'
    abbr -a -- ni niri-session
    abbr -a -- relock "env (cat /proc/(pidof swayidle)/environ | tr '\0' '\n' | rg '^(SWAYSOCK|WAYLAND_DISPLAY)') ~/.bin/wm/lock"
    abbr -a -- pkui 'pkexec env WAYLAND_DISPLAY=$WAYLAND_DISPLAY XDG_RUNTIME_DIR=$XDG_RUNTIME_DIR QT_QPA_PLATFORM=wayland'
    abbr -a -- reload_ec "sudo sh -c 'modprobe -r cros_ec_lpcs cros_ec_keyb cros_ec_typec && sleep 1 && modprobe cros_ec_lpcs && modprobe cros_ec_keyb && modprobe cros_ec_typec'"
    abbr -a -- dtach_new 'DTACH_ID=(random) dtach -c $XDG_STATE_HOME/dtach/$DTACH_ID $SHELL'
    abbr -a -- noproxy 'sudo systemd-run --system --scope -q --'

    if not command -v --quiet arp
        abbr -a -- arp 'cat /proc/net/arp'
    end
    if not command -v --quiet paru; and command -v --quiet pacman
        abbr -a -- paru pacman
    end

    # EDITOR / MANPAGER are set by ~/.config/bash/env.sh
    if set -q EDITOR
        abbr -a -- vi $EDITOR
    end
end
