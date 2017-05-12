# SOURCE FILES

[ -f /etc/bashrc ] && source /etc/bashrc
[ -f $HOME/.bash_aliases ] && source $HOME/.bash_aliases
[ -f /usr/share/git-core/contrib/completion/git-prompt.sh ] && source /usr/share/git-core/contrib/completion/git-prompt.sh
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# OPTIONS

set -o vi
shopt -s autocd
shopt -s extglob
shopt -s histappend
stty -ixon

# ENVIRONMENT VARIABLES

export EDITOR="vim"
export HISTCONTROL=ignoreboth:erasedups
export HISTSIZE=5000
export HISTFILESIZE=10000
export PATH=$PATH:$HOME/.local/bin:$HOME/bin
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
export PS1='[\u@\h \W$(declare -F __git_ps1 &>/dev/null && __git_ps1 " (%s)")]\$ '
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export TODOTXT_DEFAULT_ACTION=ls
export TODOTXT_SORT_COMMAND='env LC_COLLATE=C sort -k 2,2 -k 1,1n'

# ALIASES

alias rm="rm -Iv --preserve-root"
alias ls="ls --color=auto --group-directories-first -lh"
alias mv="mv -vi"
alias cp="cp -vi"
alias ln="ln -vi"
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
alias importFromWeb="curl -H 'application/json' -X POST --data @import.json localhost:8000/importFromWeb/"
alias cancelFromWeb="curl -H 'application/json' -X POST --data @cancel.json localhost:8000/cancelFromWeb/"
alias t='todo.sh -d $HOME/Dropbox/todo/todo.cfg'
alias simplehttp="python -m SimpleHTTPServer"

complete -F _todo t

