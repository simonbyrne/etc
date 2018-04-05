# aliases
source "$HOME/etc/shell/alias.sh"
# exports
source "$HOME/etc/shell/export.sh"


# login message:
# list running screen sessions
if [ $TERM != 'screen' ]; then
    if type screen >/dev/null 2>&1; then
	screen -ls | grep -v 'No Sockets found'
    fi
    if type tmux >/dev/null 2>&1; then
	tmux ls | grep -v 'no server running'
    fi
fi

# platform specific script
# darwin, linux
export PLATFORM="$(uname | tr '[:upper:]' '[:lower:]')"
if [ -f	"$HOME/etc/shell/$PLATFORM.sh" ]; then
    source "$HOME/etc/shell/$PLATFORM.sh"
fi

# host specific
if [ -f	"$HOME/etc/shell/local.sh" ]; then
    source "$HOME/etc/shell/local.sh"
fi

# prompt settings
source "$HOME/etc/shell/prompt.sh"

# completions
source "$HOME/etc/shell/completion.sh"

# bash history
export HISTSIZE="32768"
export HISTFILESIZE="$HISTSIZE"
export HISTCONTROL="ignoredups"
shopt -s cmdhist
shopt -s histappend
export PROMPT_COMMAND="history -a"
