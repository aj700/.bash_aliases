##########################################
#Config
# Keep 3000 lines in .bash_history (default is 500)
export HISTSIZE=3000
export HISTFILESIZE=3000

#Stop bash from caching duplicate lines.
HISTCONTROL=ignoredups

#########################################
#General
alias hm="cd ~"
alias ws="cd ~/workspace"
alias cls="clear"
alias my='sudo chown -R `id -u`'

# The ubiquitous 'll': directories first, with alphanumeric sorting:
alias ll="ls -alv --group-directories-first -F --color=always"
alias lm='ll |more'        #  Pipe through 'more'
alias lr='ll -R'           #  Recursive ls.
alias la='ll -A'           #  Show hidden files.
alias tree='tree -Csuh'    #  Nice alternative to 'recursive ls' ...

alias 1="cd .."
alias 2="cd ../../"
alias 3="cd ../../../"
alias 4="cd ../../../../"
alias 5="cd ../../../../../"
#alias doit="$(history -p !!)"

#search files, patterns etc.
alias srch='find . -name'
function srchp {
  find . -name "$1" | xargs readlink -f
}
alias searchinc='find | egrep -i "\.(c|h)$" | xargs grep'
alias searchinsrc='find | egrep -i "\.(c|h|s|cpp|py)$" | xargs grep'
alias searchinfile='find . -type f -print0 | xargs -0 grep -i'

#cd to folder and list contents
function cdl {
  cd $1;
  ls -l;
}
#create folder and cd to it
function md {
  mkdir "$1"
  cd "$1"
}
# Find a file with pattern $1 in name and Execute $2 on it:
function fae() {
  find . -type f -iname '*'"${1:-}"'*' \
  -exec ${2:-file} {} \;  ;
}

# Handy Extract Program
function extract()
{
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xvjf $1     ;;
            *.tar.gz)    tar xvzf $1     ;;
            *.bz2)       bunzip2 $1      ;;
            *.rar)       unrar x $1      ;;
            *.gz)        gunzip $1       ;;
            *.tar)       tar xvf $1      ;;
            *.tbz2)      tar xvjf $1     ;;
            *.tgz)       tar xvzf $1     ;;
            *.zip)       unzip $1        ;;
            *.Z)         uncompress $1   ;;
            *.7z)        7z x $1         ;;
            *)           echo "'$1' cannot be extracted via >extract<" ;;
        esac
    else
        echo "'$1' is not a valid file!"
    fi
}

# Creates an archive (*.tar.gz) from given directory.
function maketar() { tar cvzf "${1%%/}.tar.gz"  "${1%%/}/"; }

# Create a ZIP archive of a file or folder.
function makezip() { zip -r "${1%%/}.zip" "$1" ; }
########################################
#System related

alias rfresh="source ~/.bashrc"
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"
alias histg="history | grep"
alias top="htop"
#history | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl |  head -n10

alias reboot="sudo reboot"
alias update="sudo apt update && sudo apt upgrade -y && sudo apt autoremove --purge -y"

# Make your directories and files access rights sane.
function sanitize() { chmod -R u=rwX,g=rX,o= "$@" ;}

function my_ps() { ps $@ -u $USER -o pid,%cpu,%mem,bsdtime,command ; }
function pp() { my_ps f | awk '!/awk/ && $0~var' var=${1:-".*"} ; }
#########################################
#Git related
alias rsyncc="repo sync -c -j4"
alias rst="repo status"

alias gst="git status"
alias gtag="git tag"
alias glog="git log --pretty=oneline"
alias glogd="git log"
alias gshow="git show"
alias gshowref="git show-ref"
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias git.reset='git reset --hard;git clean -df'

#########################################
