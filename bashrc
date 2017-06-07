# SOURCE FILES

if [ -f /etc/bashrc ];
    then source /etc/bashrc
fi

if [ -f /usr/share/git-core/contrib/completion/git-prompt.sh ];
    then source /usr/share/git-core/contrib/completion/git-prompt.sh
fi

if [ -f ~/.fzf.bash ];
    then source ~/.fzf.bash
fi

# OPTIONS

set -o vi

shopt -s autocd
shopt -s cdspell
shopt -s cdable_vars
shopt -s extglob
shopt -s histappend
shopt -s checkwinsize

stty -ixon

# ENVIRONMENT VARIABLES

export EDITOR="vim"

export PATH=$PATH:$HOME/.local/bin:$HOME/bin

export HISTCONTROL=ignoreboth:erasedups
export HISTSIZE=5000
export HISTFILESIZE=10000

export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
export PS1='[\u@\h \W$(declare -F __git_ps1 &>/dev/null && __git_ps1 " (%s)")]\$ '
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true

export TODOTXT_DEFAULT_ACTION=ls
export TODOTXT_SORT_COMMAND='env LC_COLLATE=C sort -k 2,2 -k 1,1n'

export PAGER=less
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# ALIASES

alias ..="cd .."

alias ls="ls --color --group-directories-first -lh"
alias lx='ls -lXB'         #  Sort by extension.
alias lk='ls -lSr'         #  Sort by size, biggest last.
alias lt='ls -ltr'         #  Sort by date, most recent last.
alias lc='ls -ltcr'        #  Sort by/show change time, most recent last.
alias lu='ls -ltur'        #  Sort by/show access time, most recent last.

alias rm="rm -Iv --preserve-root"
alias mv="mv -vi"
alias cp="cp -vi"
alias ln="ln -vi"
alias mkdir="mkdir -p"

alias du='du -kh'
alias df='df -kTh'

alias path='echo -e ${PATH//:/\\n}'

alias shutdown="sudo shutdown now"
alias reboot="sudo shutdown -r now"

alias status="systemctl status"
alias start="systemctl start"
alias restart="systemctl restart"
alias stop="systemctl stop"
alias enable="systemctl enable"
alias disable="systemctl disable"

alias vu="vagrant up"
alias vh="vagrant halt"
alias vssh="vagrant ssh"
alias vsus="vagrant suspend"
alias vres="vagrant resume"
alias vs="vagrant status"
alias vgs="vagrant global-status"

alias ga="git add"
alias gc="git commit"
alias gd="git diff"
alias gs="git status"
alias gl="git glog"
alias gp="git push"
alias gf="git fetch --all"
alias gh="git show HEAD"

alias importFromWeb="curl -H 'application/json' -X POST --data @import.json localhost:8000/importFromWeb/"
alias cancelFromWeb="curl -H 'application/json' -X POST --data @cancel.json localhost:8000/cancelFromWeb/"

alias t='todo.sh -d $HOME/Dropbox/todo/todo.cfg'
complete -F _todo t

alias simplehttp="python -m SimpleHTTPServer"

# FUNCTIONS

function extract() {
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


function maketar() {
    tar cvzf "${1%%/}.tar.gz"  "${1%%/}/";
}


function makezip() {
    zip -r "${1%%/}.zip" "$1" ;
}
