alias cls="CLICOLOR_FORCE=1 ls"
alias ls="ls -p"
export LSCOLORS="exfxcxdxbxegedabagacad" #gxBxhxDxfxhxhxhxhxcxcx

# bash completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi


# OS X only
alias lock="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

alias sleepnow="pmset sleepnow"
alias reboot="shutdown -r now"

# see https://coolaj86.com/articles/how-to-control-os-x-system-volume-with-applescript/
alias mute="osascript -e 'set volume with output muted'"
alias unmute="osascript -e 'set volume without output muted'"



function notify {
    WID=`osascript -e 'tell app "Terminal" to id of first window'`
    $*
    osascript <<EOC
tell app "Terminal"
    set frontmost of window id $WID to true
    activate
end tell
EOC
}
