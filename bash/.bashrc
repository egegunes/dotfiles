# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Source user definitions
if [ -f $HOME/.bash_aliases ]; then
    . $HOME/.bash_aliases
fi

if [ -f $HOME/.bash_prompt ]; then
    . $HOME/.bash_prompt
fi

set -o vi

shopt -s autocd
shopt -s extglob
shopt -s histappend

stty -ixon

export EDITOR="vim"
export HISTCONTROL=ignoreboth:erasedups
export HISTSIZE=5000
export HISTFILESIZE=10000
export PATH=$PATH:$HOME/.local/bin:$HOME/bin
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
export LC_ALL="C"
