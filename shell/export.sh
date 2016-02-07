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


# colour
export CLICOLOR=1

# bash history
export HISTSIZE="32768";
export HISTFILESIZE="${HISTSIZE}";

# less automatic colors when appropriate
export LESS="-R"
# less preprocessor
export LESSOPEN="|. ~/etc/shell/lesspipe.sh %s"

# some nice colours
if [ "$PLATFORM" = "darwin" ]; then
    export LSCOLORS="exfxcxdxbxegedabagacad" #gxBxhxDxfxhxhxhxhxcxcx
elif [ "$PLATFORM" = "linux" ]; then
    export LS_COLORS="di=34;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:"
fi



if [ -n "$DISPLAY" ]; then
    # X running
    export EDITOR="emacsclient --alternate-editor='' -c -n"
    export GIT_EDITOR="emacsclient --alternate-editor='' -c"
else
    export EDITOR="emacs"
fi
