export ZSH=/home/maxnoe/.oh-my-zsh

ZSH_THEME=""
source ~/.powerlevel9k/powerlevel9k.zsh-theme
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context anaconda dir)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(vcs status root_indicator background_jobs)
export DEFAULT_USER=maxnoe

HIST_STAMPS="yyyy-mm-dd"

source $ZSH/oh-my-zsh.sh

eval `dircolors ~/.dircolors`
