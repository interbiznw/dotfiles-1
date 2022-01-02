# Reload the shell (i.e. invoke as a login shell with .bash_profile, which likely this file)
# switch -l to -i if you just want to reload this file
alias rebash="exec $SHELL -l"

# Display memory info totals
alias meminfo="free -m -l -t"

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'


alias gti='git'
#alias tmux='tmux -2'
alias less='less -R'
alias diff='colordiff'
alias dc='cd'
alias nethack-online='ssh nethack@nethack.alt.org ; clear'
alias tron-online='ssh sshtron.zachlatta.com ; clear'
alias glog='git log --oneline --graph --color --all --decorate'

alias bdae="btcpd -datadir=$HOME/.zcash"
alias bcli="btcp-cli -datadir=$HOME/.zcash"

getT(){
    bcli gettransaction "$1"
}
getRawT(){
    bcli getrawtransaction "$1"
}
decoderawtx(){
    bcli decoderawtransaction "$1"
}

alias ipp="curl icanhazip.com"
alias ufws="sudo ufw status numbered"
#ROOT ALIASES
ta(){
    tmux attach -t "$1"
}
banip() {
    #do things with parameters like $1 such as
    #mv "$1" "$1.bak"
    #iptables -A INPUT -s "$1" -j DROP
    sudo ufw deny from "$1" to any
}
unbanip() {
    #do things with parameters like $1 such as
    #mv "$1" "$1.bak"
    #iptables -D INPUT -s "$1" -j DROP
    sudo ufw delete "$1"
}
tails() {
    tail -f $1 | perl -pe 's/'$2'/\e[1;32;40m$&\e[0m/g'
}

transfer(){ if [ $# -eq 0 ];then echo "No arguments specified.\nUsage:\n transfer <file|directory>\n ... | transfer <file_name>">&2;return 1;fi;if tty -s;then file="$1";file_name=$(basename "$file");if [ ! -e "$file" ];then echo "$file: No such file or directory">&2;return 1;fi;if [ -d "$file" ];then file_name="$file_name.zip";(cd "$file"&&zip -r -q - .)|curl --progress-bar --upload-file "-" "https://xfr.anonpasta.rocks/$file_name"|tee /dev/null;echo " << download zip file";else cat "$file"|curl --progress-bar --upload-file "-" "https://xfr.anonpasta.rocks/$file_name"|tee /dev/null;echo " << download file";fi;else file_name=$1;curl --progress-bar --upload-file "-" "https://xfr.anonpasta.rocks/$file_name"|tee /dev/null;echo " << download zip file";fi;}

# Create a new dir and enter it
function mkd() {
        mkdir -p "$@" && cd "$@"
}

# Sudo nano a file
function edit() {
        sudo nano "$@"
}

# Zip this dir recursively
function zipthis() {
        thisdir=${PWD##*/}
        sudo zip -r $thisdir.zip .
}

# List the sub dir sizes in human readable format as a summary
function dirsizes() {
        sudo du -h -s *
}

# open tmux session by number
function tm() {
        tmux attach -t "$@"
}

