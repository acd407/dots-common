# Theme + TTY palette.
# Global scope, per fish >= 4.3 (this replaces the old universal 99_colors.fish
# and the generated fish_frozen_theme.fish, which held identical values).

set -g fish_color_autosuggestion 969896
set -g fish_color_cancel --reverse
set -g fish_color_command c397d8
set -g fish_color_comment e7c547
set -g fish_color_cwd cfa900
set -g fish_color_cwd_root red
set -g fish_color_end c397d8
set -g fish_color_error d54e53
set -g fish_color_escape 00a6b2
set -g fish_color_history_current --bold
set -g fish_color_host 729fcf
set -g fish_color_host_remote
set -g fish_color_keyword
set -g fish_color_match --background=brblue
set -g fish_color_normal eeeeec
set -g fish_color_operator 00a6b2
set -g fish_color_option
set -g fish_color_param 7aa6da
set -g fish_color_quote b9ca4a
set -g fish_color_redirection 70c0b1
set -g fish_color_search_match white --background=brblack
set -g fish_color_selection white --bold --background=brblack
set -g fish_color_status red
set -g fish_color_user 8ae234
set -g fish_color_valid_path --underline
set -g fish_pager_color_background
set -g fish_pager_color_completion normal
set -g fish_pager_color_description B3A06D
set -g fish_pager_color_prefix normal --bold --underline
set -g fish_pager_color_progress brwhite --background=cyan
set -g fish_pager_color_secondary_background
set -g fish_pager_color_secondary_completion
set -g fish_pager_color_secondary_description
set -g fish_pager_color_secondary_prefix
set -g fish_pager_color_selected_background --background=brblack
set -g fish_pager_color_selected_completion
set -g fish_pager_color_selected_description
set -g fish_pager_color_selected_prefix
set -g fish_cursor_insert underscore
set -g fish_key_bindings fish_default_key_bindings

# Linux console (TTY) palette
if test "$TERM" = linux
    echo -e \
        '\\e]P0000000' \
        '\\e]P1db0000' \
        '\\e]P260bd07' \
        '\\e]P3cfa900' \
        '\\e]P43c74bd' \
        '\\e]P594659c' \
        '\\e]P606989a' \
        '\\e]P7d3d7cf' \
        '\\e]P8383633' \
        '\\e]P9ef2929' \
        '\\e]Pa8ae234' \
        '\\e]Pbfce94f' \
        '\\e]Pc729fcf' \
        '\\e]Pdad7fa8' \
        '\\e]Pe34e2e2' \
        '\\e]Pfeeeeec'
end
