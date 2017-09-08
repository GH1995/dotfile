#!/bin/bash

if [ ! -e ~/.latexmkrc ]
then
    ln latexmkrc ~/.latexmkrc
fi

if [ ! -e ~/.npmrc ]
then
    ln npmrc ~/.npmrc
fi

if [ ! -e ~/.pip/pip.conf ]
then
    mkdir -p ~/.pip
    ln pip.conf ~/.pip/pip.conf
fi

if [ ! -e ~/.zshrc ]
then
    ln zshrc ~/.zshrc
fi
