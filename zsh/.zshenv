export EDITOR='nvim'
export BROWSER=google-chrome-stable

alias vim=nvim
alias gits='git status -s'
alias ezrc='vim ~/.zshrc'
alias szrc='source ~/.zshrc'

alias updatetl='tlmgr update --self --all --reinstall-forcibly-removed'

if [ -f $HOME/.local/anaconda/etc/profile.d/conda.sh ]; then
	source $HOME/.local/anaconda/etc/profile.d/conda.sh
fi

if [ -f $HOME/.local/anaconda3/etc/profile.d/conda.sh ]; then
	source $HOME/.local/anaconda3/etc/profile.d/conda.sh
fi

if [ -f $HOME/.local/root6/bin/thisroot.sh ]; then
	source $HOME/.local/root6/bin/thisroot.sh
fi

if type "envoy" > /dev/null; then
	source <(envoy -p)
fi

if type "pyenv" > /dev/null; then
	eval "$(pyenv init -)"
fi
