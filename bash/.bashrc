# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Source user specific aliases
if [ -f $HOME/.bash_aliases ]; then
    . $HOME/.bash_aliases
fi

if [ -f $HOME/.bash_prompt ]; then
    . $HOME/.bash_prompt
fi

shopt -s autocd
shopt -s extglob

stty -ixon

set -o vi

export HISTCONTROL=ignoreboth:erasedups

export EDITOR="vim"
