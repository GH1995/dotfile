export TERM=xterm-256color

# for autojump
. /usr/share/autojump/autojump.zsh

# user's command
alias dir="tree -L 2"
alias rm='trash'
alias s="ls"

# added by Anaconda3 installer
export PATH="${HOME}/anaconda3/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# spark
export JAVA_HOME="/usr/lib/jvm/java-1.8.0-openjdk-amd64"
export SPARK_HOME=/bin/spark-2.3.1
export PATH=$SPARK_HOME/bin:$PATH
export PYTHONPATH=$SPARK_HOME/python/:$PYTHONPATH

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Plugins
plugins=(
  zsh-nvm
  tmux
  git
  nvm
)

source $ZSH/oh-my-zsh.sh
