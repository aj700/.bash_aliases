alias cls="clear"
alias ll="ls -alv --group-directories-first -F --color=always"
alias la='ll -A'

alias srch='find . -name'
alias srch_flag='find . -name flag*.* 2>&1 | grep -v "Permission denied"'
alias searchinfile='find . -type f -print0 | xargs -0 grep -i'

alias my='sudo chown -R `id -u`'

alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"
alias histg="history | grep"
