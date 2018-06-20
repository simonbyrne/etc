# trailing slash for directories
alias lsl="ls -l"
alias lsd="CLICOLOR_FORCE=1 ls -p | grep --color=never '/$'"

# colour grep by default
alias grep="grep --color=auto"

alias cgrep="grep --color=always"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
#alias -- -="cd -"

if [ -n "$SSH_CLIENT" ]; then
    alias ec="emacs"
else
    alias ec="emacsclient --alternate-editor='' -c -n"
fi

