case "$TERM" in
    dumb)
	PS1="> "
	;;
    *color)
	if [ -n "$SSH_CLIENT" ]; then
	    PS1_HOST='\[\e[31m\]\h';
	else
	    PS1_HOST='\[\e[1;30m\]\h';
	fi
	if [ -n "$STY" ]; then
	    PS1_SCREEN="[s: $STY]";
        elif [ -n "$TMUX" ]; then
	    PS1_SCREEN="[t: $TMUX]";
	else
	    PS1_SCREEN='─────────────────────────────────';
	fi

	if type __git_ps1 >/dev/null 2>&1; then
	    PS1_GIT='$(__git_ps1 "(\[\e[1;30m\]%s\[\e[0;30m\])")';
            GIT_PS1_SHOWDIRTYSTATE=1
            GIT_PS1_SHOWSTASHSTATE=1
            # GIT_PS1_SHOWUNTRACKEDFILES=1
            GIT_PS1_SHOWUPSTREAM="auto"
	else
	    PS1_GIT='';
	fi
	PS1='\[\e[0;30m\]┌─[\#]──[\d]──[\t]──'"$PS1_SCREEN"'─────\n│ \[\e[1;30m\]\u\[\e[0;30m\]@'"$PS1_HOST"'\[\e[0;30m\]:\[\e[0;36m\]\w\[\e[0;30m\] '"$PS1_GIT"'\n├ \[\e[0m\]'
	PS2='\[\e[0;30m\]├ \[\e[0m\]'
	unset PS1_HOST PS1_GIT PS1_SCREEN
	;;
    *)
	if [ -n "$STY" ]; then
	    PS1_SCREEN="[s: $STY]";
        elif [ -n "$TMUX" ]; then
	    PS1_SCREEN="[t: $TMUX]";
	else
	    PS1_SCREEN='─────────────────────────────────';
	fi

	if type __git_ps1 >/dev/null 2>&1; then
	    PS1_GIT='$(__git_ps1 "(%s)")';
            GIT_PS1_SHOWDIRTYSTATE=1
            GIT_PS1_SHOWSTASHSTATE=1
            # GIT_PS1_SHOWUNTRACKEDFILES=1
            GIT_PS1_SHOWUPSTREAM="auto"
	else
	    PS1_GIT='';
	fi
	PS1='┌─[\#]──[\d]──[\t]──'"$PS1_SCREEN"'─────\n│ \u@\h:\w '"$PS1_GIT"'\n├ '
	PS2='├'
	unset PS1_GIT PS1_SCREEN
	;;

esac
# set maxdepth
PROMPT_DIRTRIM=4
