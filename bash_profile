if [ -f $HOME/.bashrc ]; then
    . $HOME/.bashrc
fi

killall gpg-agent ssh-agent &> /dev/null

eval $(gpg-agent --daemon --enable-ssh-support)
