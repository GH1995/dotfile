#!/bin/bash
#!/bin/bash

OH_MY_ZSH=$HOME"/.oh-my-zsh"
VIMRC=$HOME"/.vim/vimrc"

IS_VIM=0
IS_GIT=0
IS_TMUX=0
IS_PIP=0
IS_ZSH=0
IS_CONDA=0
IS_LATEX=0
IS_NPM=0

# Pre check
check_installed() {
    softwares=("vim" "git" "tmux" "pip" "zsh" "conda" "latex" "npm")

    for sw in "${softwares[@]}"; do
        flag="IS_${sw^^}"  # bash >= 4.0
        # Notice the semicolon
        # Dynamic naming:
        # - https://stackoverflow.com/a/13717788/1276501
        # - https://stackoverflow.com/a/18124325/1276501
        type ${sw} > /dev/null 2>&1 && { printf -v "${flag}" 1; } || { echo >&2 "[WARN] \`${sw}' is not installed, ignore it."; }
    done
}

create_symlinks() {
    dotfile_src=$1
    dotfile_dst=$2

    if [[ "$dotfile_dst" != /* ]]; then
        dotfile_dst=$HOME/$dotfile_dst
    fi
    if [[ -e $dotfile_dst ]]; then
        if [[ -h $dotfile_dst ]]; then
            ln -sf $PWD/$dotfile_src $dotfile_dst
            echo "Update existed symlink $dotfile_dst"
        else
            echo "[WARN] Ignore due to $dotfile_dst exists and is not a symlink"
        fi
    else
        ln -sf $PWD/$dotfile_src $dotfile_dst
        echo "Create symlink $dotfile_dst"
    fi
}

# Vim
config_vim() {
    if [[ -d "${VIMRC}" ]]; then
        cd "${VIMRC}"
        echo "Change directory to `pwd`"
        echo "${VIMRC} exists, Git pull to latest..."
		git pull
		cd - > /dev/null 2>&1
        echo "Change directory back to `pwd`"
    else
        echo "${VIMRC} not exists, Git clone to create..."
        git clone https://github.com/GH1995/vimrc.git ${VIMRC}
        curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
                https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        create_symlinks "${VIMRC}/vimrc_real" $HOME/".vimrc"
        vim +PluginInstall +qall
    fi
}


# Git
config_git() {
    create_symlinks "git/gitconfig" ".gitconfig"
    create_symlinks "git/gitignore" ".gitignore"
}

# ZSH
config_zsh() {
    if [ -d "${OH_MY_ZSH}"  ]; then
        cd "${OH_MY_ZSH}"
        echo "Change directory to `pwd`"
        echo "${OH_MY_ZSH} exists. Git pull to update..."
        git pull
        cd - > /dev/null 2>&1
        echo "Change directory back to `pwd`"
    else
        echo "${OH_MY_ZSH} not exists. Install..."
        #git clone git@github.com:robbyrussell/oh-my-zsh.git ${HOME}/.oh-my-zsh
        #wget --no-check-certificate http://install.ohmyz.sh -O - | sh
        git clone https://github.com/robbyrussell/oh-my-zsh.git ${HOME}/.oh-my-zsh
    fi

    if grep  -vq "zsh_custom.sh" "${HOME}/.zshrc"; then
        echo 'source ${HOME}/.dotfile/zsh/zsh_custom.sh' >> "${HOME}/.zshrc"
    fi
}

config_pip(){
    [ -d ${HOME}/.pip ] || { mkdir $HOME/.pip; echo "mkdir $HOME/.pip"; }
    create_symlinks "pip/pip.conf" ".pip/pip.conf"
}

config_tmux() {
    if [[ -d "${HOME}/.tmux" ]]; then
        cd "${HOME}/.tmux"
        echo "Change directory to `pwd`"
        echo "${HOME}/.tmux exists. Git pull to update..."
        git pull
        cd - > /dev/null 2>&1
        echo "Change directory back to `pwd`"
    else
        echo "${HOME}/.tmux not exists. Install..."
        cd - > /dev/null 2>&1
        echo "Change directory to `pwd`"
        git clone https://github.com/gpakosz/.tmux.git ${HOME}/.tmux
        create_symlinks "${HOME}/.tmux/.tmux.conf" "${HOME}/.tmux.conf"
        cp .tmux/.tmux.conf.local ${HOME}
    fi
}


config_conda() {
    create_symlinks "conda/condarc" ".condarc"
}

config_latex() {
    create_symlinks "latex/latexmkrc" ".latexmkrc"
}

config_npm() {
    create_symlinks "npm/npmrc" ".npmrc"
}

check_installed
[ $IS_VIM -eq 1 ] && config_vim
[ $IS_GIT -eq 1 ] && config_git
[ "$IS_ZSH" -eq 1 ] && config_zsh
[ $IS_PIP -eq 1 ] && config_pip
[ $IS_TMUX -eq 1 ] && config_tmux
[ $IS_CONDA -eq 1 ] && config_conda
[ $IS_LATEX -eq 1 ] && config_latex
[ $IS_NPM -eq 1 ] && config_npm

echo "[SETUP OK]"
