#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias vim='nvim'
alias ..='cd ..'
alias ls='ls --color=auto'
alias ll='ls -lh'
alias lla=' ls -lha'
alias dir="dir --color=auto"
alias grep="grep --color=auto"
alias dmesg='dmesg --color'
alias gits='git status -s'
alias ebrc='vim ~/.bashrc'
alias sbrc='source ~/.bashrc'
alias updatetl='tlmgr update --self --all --reinstall-forcibly-removed'
alias sa='source activate'
alias godark="source $HOME/.config/base16-shell/scripts/base16-default-dark.sh"
alias golight="source $HOME/.config/base16-shell/scripts/base16-default-light.sh"
godark

export EDITOR=nvim
export BROWSER=firefox

eval `dircolors ~/.dircolors`

complete -cf sudo
complete -cf man

source $HOME/.bash_prompt
source $HOME/.bash_functions

[ -f ~/.git-completion.bash ] && source $HOME/.git-completion.bash
[ -f $HOME.travis/travis.sh ] && source $HOME/.travis/travis.sh
[ -f ~/.local/root6/bin/thisroot.sh ] && source $HOME/.local/root6/bin/thisroot.sh
[ -f $HOME/.local/anaconda3/etc/profile.d/conda.sh ] && source $HOME/.local/anaconda3/etc/profile.d/conda.sh

if [ -x "$(command -v pyenv)" ]; then
	eval "$(pyenv init -)"
	export PYENV_VIRTUALENV_DISABLE_PROMPT=0
fi
