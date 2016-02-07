# trailing slash for directories
alias ls="ls -p"
alias lsl="ls -l"
alias lsd="CLICOLOR_FORCE=1 ls -p | grep --color=never '/$'"

# colour grep by default
alias grep="grep --color=auto"

# force colour for ls and grep
if [ "$PLATFORM" = "darwin" ]; then
    alias cls="CLICOLOR_FORCE=1 ls"
elif [ "$PLATFORM" = "linux" ]; then
    alias cls="ls --color=always"
fi
alias cgrep="grep --color=always"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
#alias -- -="cd -"

alias emacsc="emacsclient --alternate-editor='' -c -n"
