# ~/.profile -- bash login shell entry point (POSIX-compatible)
#
# Interactive login shells hand over to fish at the end. Non-interactive shells
# (agents, scripts) do NOT read this file; they load the same environment via
# $BASH_ENV (exported below).
#
# /etc/profile (and thus /etc/profile.d/*.sh) is sourced by bash automatically
# before this file; do not source it again here.

# 1. systemd environment.d -> shell.
#    Needed for tty/ssh logins: those shells are not children of the systemd
#    user manager, so they do not inherit environment.d on their own.
#    In the graphical session this is a harmless (idempotent) re-import.
if [ -d "${HOME}/.config/environment.d" ]; then
    for _envf in "${HOME}"/.config/environment.d/*.conf; do
        [ -f "${_envf}" ] || continue
        set -a
        . "${_envf}"
        set +a
    done
    unset _envf
fi

# 2. shared shell environment (single source of truth)
[ -r "${HOME}/.config/bash/env.sh" ] && . "${HOME}/.config/bash/env.sh"

# 3. non-interactive bash (agents, scripts, bg tasks) loads the same environment
export BASH_ENV="${HOME}/.config/bash/env.sh"

# 4. one-off runtime dirs
[ -d "${XDG_STATE_HOME:-${HOME}/.local/state}" ] && \
    mkdir -p "${XDG_STATE_HOME:-${HOME}/.local/state}/dtach"

# 5. interactive login -> fish; keep bash for scripts/agents
case $- in
    *i*) exec fish ;;
esac
