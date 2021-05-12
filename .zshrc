# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster-light"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git brew pip cabal coffee docker git-extras httpie python tmux)

export EDITOR=nvim
export REPORTTIME=20
export TERM=screen-256color
export HISTFILE=~/.zsh_history
export HISTSIZE=1000000
export SAVEHIST=$HISTSIZE

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$PATH:/Developer/android/tools:/Developer/android/platform-tools:~/Library/haskell/bin/

# GO
# export GOROOT=/usr/local/go
export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin
export GOPATH=$HOME/go

#Alias
alias awx="ssh -t awx tmux attach -d -t dan"
alias vim="nvim"
alias fix="git diff --name-only | uniq | tr '\n' '\0' | xargs -0 -o vim"

gifify() {
    ffmpeg -i "$1" -filter:v scale=400:-1 -pix_fmt rgb24 -r 30 -f gif - | gifsicle --optimize=3
}

# Arduino
export SDK_PATH=/Users/jag/repos/homekit/esp-open-rtos
export GPG_TTY=$(tty)

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/jag/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/jag/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/jag/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/jag/google-cloud-sdk/completion.zsh.inc'; fi
