# reuse ssh bash completion
if SSH=`complete -p ssh 2> /dev/null`; then
    ${SSH}-init-etc
fi
