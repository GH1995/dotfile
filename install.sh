#!/bin/bash

if [ ! -e ~/.latexmkrc ]
then
    ln ~/dotfile/latexmkrc ~/.latexmkrc
fi

if [ ! -e ~/.npmrc ]
then
    ln ~/dotfile/npmrc ~/.npmrc
fi

if [ ! -e ~/.pip/pip.conf ]
then
    mkdir -p ~/.pip
    ln ~/dotfile/pip.conf ~/.pip/pip.conf
fi

if [ ! -e ~/.zshrc ]
then
    ln ~/dotfile/zshrc ~/.zshrc
else
    rm ~/.zshrc
    ln ~/dotfile/zshrc ~/.zshrc
fi

if [ -e ~/.tmux.conf.local ]
then
    rm ~/.tmux.conf.local
    ln ~/dotfile/tmux.conf.local ~/.tmux.conf.local
else
    git clone git@github.com:gpakosz/.tmux.git ~
    ln -s -f .tmux/.tmux.conf
    ln ~/dotfile/tmux.conf.local ~/.tmux.conf.local
fi
