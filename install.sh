#!/bin/bash

rm -rf ~/.latexmkrc
ln ~/dotfile/latexmkrc ~/.latexmkrc

rm -rf ~/.npmrc
ln ~/dotfile/npmrc ~/.npmrc

rm -rf ~/.pip/pip.conf
mkdir -p ~/.pip && ln ~/dotfile/pip.conf ~/.pip/pip.conf

rm -rf ~/.zshrc
ln ~/dotfile/zshrc ~/.zshrc

if [ ! -d ~/.tmux ]; then
    git clone git@github.com:gpakosz/.tmux.git && \
    ln -s -f .tmux/.tmux.conf && \
    ln ~/dotfile/tmux.conf.local ~/.tmux.conf.local
fi
