#!/bin/bash

rm -rf ~/.latexmkrc
ln ~/dotfile/latexmkrc ~/.latexmkrc

rm -rf ~/.npmrc
ln ~/dotfile/npmrc ~/.npmrc

rm -rf ~/.pip/pip.conf
mkdir -p ~/.pip && ln ~/dotfile/pip.conf ~/.pip/pip.conf

rm -rf ~/.zshrc
ln ~/dotfile/zshrc ~/.zshrc

rm -rf ~/.tmux ~/.tmux.conf ~/.tmux.conf.local
cd && git clone git@github.com:gpakosz/.tmux.git && \
ln -s -f .tmux/.tmux.conf
