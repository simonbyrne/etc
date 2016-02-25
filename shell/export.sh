# various useful paths
if [ -d "/usr/local/share/python" ]; then
    PATH=/usr/local/share/python:$PATH
fi
if [ -d "/usr/local/bin" ]; then
    PATH=/usr/local/bin:$PATH
fi
if [ -d "$HOME/bin" ]; then
    PATH=$HOME/bin:$PATH
fi
if [ -d "$HOME/etc/bin" ]; then
    PATH=$HOME/etc/bin:$PATH
fi


# colour
export CLICOLOR=1

# bash history
export HISTSIZE="32768";
export HISTFILESIZE="${HISTSIZE}";

# less automatic colors when appropriate
export LESS="-R"
# less preprocessor
export LESSOPEN="|. ~/etc/shell/lesspipe.sh %s"


if [ -n "$DISPLAY" ]; then
    # X running
    export EDITOR="emacsclient --alternate-editor='' -c -n"
    export GIT_EDITOR="emacsclient --alternate-editor='' -c"
else
    export EDITOR="emacs"
fi
