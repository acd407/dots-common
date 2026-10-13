# ~/.bashrc -- interactive, NON-login bash
#
# This is what a terminal emulator gets when it runs $SHELL inside the
# graphical session. The login environment is normally inherited from the
# session; env.sh is sourced defensively so this path is self-contained.

[ -r "${HOME}/.config/bash/env.sh" ] && . "${HOME}/.config/bash/env.sh"
export BASH_ENV="${HOME}/.config/bash/env.sh"

# Interactive -> fish, but stay in bash when this is a one-shot
# `bash -ic '...'` (BASH_EXECUTION_STRING set) or when there is no real tty.
case $- in
    *i*)
        if [ -z "${BASH_EXECUTION_STRING:-}" ] && [ -t 0 ]; then
            exec fish
        fi
        ;;
esac
