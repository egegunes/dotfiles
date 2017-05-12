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

complete -F _todo t

