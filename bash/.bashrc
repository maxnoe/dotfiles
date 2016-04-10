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
alias open='xdg-open $1 > /dev/null 2> /dev/null'
alias ebrc='vim /home/maxnoe/.bashrc'
alias sbrc='source ~/.bashrc'
alias updatetl='tlmgr update --self --all --reinstall-forcibly-removed'
alias sa='source activate'

export EDITOR=nvim
export BROWSER=google-chrome-stable

complete -cf sudo
complete -cf man

source /home/maxnoe/.bash_prompt
source /home/maxnoe/.bash_functions
if [ -f ~/.git-completion.bash ]; then
	  . ~/.git-completion.bash
fi


#ruby gems
export PATH="/home/maxnoe/.gem/ruby/2.3.0/bin:$PATH"

export PATH="/home/maxnoe/.local/truee/bin:$PATH"
TF_ALIAS=fuck alias fuck='eval $(thefuck $(fc -ln -1)); history -r'
root6py35

# added by travis gem
[ -f /home/maxnoe/.travis/travis.sh ] && source /home/maxnoe/.travis/travis.sh
