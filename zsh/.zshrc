export ZSH=/home/maxnoe/.oh-my-zsh

ZSH_THEME=""
source ~/.powerlevel9k/powerlevel9k.zsh-theme
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context virtualenv pyenv anaconda dir)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(vcs status background_jobs)
export DEFAULT_USER="$(whoami)"

HIST_STAMPS="yyyy-mm-dd"

source $ZSH/oh-my-zsh.sh

eval `dircolors ~/.dircolors`
unset LESS # undo ohmyzsh -R

if [ -f $HOME/.local/anaconda3/etc/profile.d/conda.sh ]; then
	source $HOME/.local/anaconda3/etc/profile.d/conda.sh
fi
