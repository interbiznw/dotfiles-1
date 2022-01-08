# console coloring for kool kids
PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

echo "bash_profile RUN FIRST"

# if this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# impersonate a user
alias user="su -ls /bin/bash"
alias v="ls -lA"


if [ -n "$TMUX" ]; then
    echo "Tmux session detected"
    # called inside tmux session, do tmux things
    #for debugging: echo "known tmux session"
    . ~/.profile
else

    echo "this is bash_profile, running bash.rc"
    # Trigger ~/.bashrc commands
    . ~/.bashrc
    cat /mnt/cache/appdata/UNRAID_CONFIG/banner.txt
fi
