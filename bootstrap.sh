#!/bin/bash

set -e

echo "Linking bash_profile..."
if [ -L $HOME/.bash_profile ]; then
    echo "Already linked."
else
    if [ -f $HOME/.bash_profile ]; then
        rm -v $HOME/.bash_profile
    fi
    ln -s $HOME/.dotfiles/bash_profile $HOME/.bash_profile
    echo "Done"
fi

echo "Linking bashrc..."
if [ -L $HOME/.bashrc ]; then
    echo "Already linked."
else
    if [ -f $HOME/.bashrc ]; then
        rm -v $HOME/.bashrc
    fi
    ln -s $HOME/.dotfiles/bashrc $HOME/.bashrc
    echo "Done"
fi

echo "Linking vimrc..."
if [ -d $HOME/.vim ]; then
    if [  -L $HOME/.vim/vimrc ]; then
        echo "Already linked"
    else
        if [ -f $HOME/.vim/vimrc ]; then
            rm -v $HOME/.vim/vimrc
        fi
        ln -s $HOME/.dotfiles/vimrc $HOME/.vim/vimrc
        echo "Done"
    fi
else
    mkdir $HOME/.vim
    ln -s $HOME/.dotfiles/vimrc $HOME/.vim/vimrc
    echo "Done"
fi

echo "Linking tmux.conf..."
if [ -L $HOME/.tmux.conf ]; then
    echo "Already linked."
else
    if [ -f $HOME/.tmux.conf ]; then
        rm -v $HOME/.tmux.conf
    fi
    ln -s $HOME/.dotfiles/tmux.conf $HOME/.tmux.conf
    echo "Done"
fi

echo "Linking gitconfig..."
if [ -L $HOME/.gitconfig ]; then
    echo "Already linked."
else
    if [ -f $HOME/.gitconfig ]; then
        rm -v $HOME/.gitconfig
    fi
    ln -s $HOME/.dotfiles/gitconfig $HOME/.gitconfig
    echo "Done"
fi

echo "Loading tilix configuration..."
dconf load /com/gexperts/Tilix/ < $HOME/.dotfiles/tilix.dconf
echo "Done"
echo "Loading nautilus configuration..."
dconf load /org/gnome/nautilus/ < $HOME/.dotfiles/nautilus.dconf
echo "Done"

exit 0
