# bash completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

# OS X only
alias lock="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
alias sleepnow="pmset sleepnow"

# see https://coolaj86.com/articles/how-to-control-os-x-system-volume-with-applescript/
alias mute="osascript -e 'set volume with output muted'"
alias unmute="osascript -e 'set volume without output muted'"
