# aliases
source "$HOME/etc/shell/alias.sh"
# exports
source "$HOME/etc/shell/export.sh"


# login message:
# list running screen sessions
if [ $TERM != 'screen' ]; then
    screen -ls | grep -v 'No Sockets found'
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
