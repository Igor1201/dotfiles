export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="spaceship"
SPACESHIP_KUBECONTEXT_SHOW=false
SPACESHIP_PACKAGE_SHOW=false
SPACESHIP_NODE_SHOW=false

plugins=(gitfast osx)

source $ZSH/oh-my-zsh.sh

autoload -U add-zsh-hook

# for some reason this doesn't work on .zprofile
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
