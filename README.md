# dotfile

> 在安装之前建议先配置`vim`，可以参考[我的配置](https://github.com/GH1995/vimrc)。

这是一个Ubuntu安装后的配置文件。首先，你需要安装必要的软件：

```sh
sudo apt install zsh git cmake build-essential glances tmux texlive-full
```

## 安装步骤

`anaconda`
:	`wget -c https://mirrors.tuna.tsinghua.edu.cn/anaconda/archive/Anaconda3-5.2.0-Linux-x86_64.sh`，然后`bash Anaconda3-5.2.0-Linux-x86_64.sh`。之后需要做的就是配置`.condarc`，`ln -s ~/.dotfile/condarc ~/.condarc`。

`oh-my-zsh`
:	`sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"`, `ln -s -f ~/.dotfile/zshrc ~/.zshrc`

`tmux`
:	`cd`, `git clone https://github.com/gpakosz/.tmux.git`, `ln -s -f .tmux/.tmux.conf`, `cp .tmux/.tmux.conf.local .`

`git`
:	`ln -s -f ~/.dotfile/gitconfig ~/.gitconfig`, `ln -s -f ~/.dotfile/gitignore ~/.gitignore`

`latex`
:	`ln -s -f ~/.dotfile/latexmkrc ~/.latexmkrc`

`pip`
:	`mkdir ~/.pip`, `ln -s -f ~/.dotfile/pip.conf ~/.pip/pip.conf`

`npmrc`
:	`ln -s -f ~/.dotfile/npmrc ~/.npmrc`
