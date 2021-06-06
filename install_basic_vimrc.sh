#!/bin/sh
set -e

vimrc="~/.vimrc"
if [ -f "$vimrc" ]; then
    echo "copy origin .vimrc to .vimrc_backup"
    cp "$vimrc" ~/.vimrc_backup
fi

cd ~/.vim_runtime
cat ~/.vim_runtime/vimrcs/basic.vim > ~/.vimrc
echo "Installed the Basic Vim configuration successfully! Enjoy :-)"
