# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git brew pip cabal coffee docker git-extras httpie python sudo tmux)

export EDITOR=vim
export REPORTTIME=20
export TERM=screen-256color
export HISTSIZE=1000000

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$PATH:/Developer/android/tools:/Developer/android/platform-tools:~/Library/haskell/bin/

# GO
# export GOROOT=/usr/local/go
export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin
export GOPATH=$HOME/go

bindkey -e
bindkey '[C' forward-word
bindkey '[D' backward-word
bindkey 'OC' forward-word
bindkey 'OD' backward-word

#Alias
alias awx="ssh -t awx tmux attach -d -t dan"
alias vim="nvim"
alias fix="git diff --name-only | uniq | xargs -o vim"

# Libraries for osx 10.10
export C_INCLUDE_PATH=/usr/include:/usr/local/include
export CPLUS_INCLUDE_PATH=/usr/include:/usr/local/include
