export EDITOR='nvim'
export BROWSER=google-chrome-stable

alias vim=nvim
alias gits='git status -s'
alias ezrc='vim ~/.zshrc'
alias szrc='source ~/.zshrc'

alias updatetl='tlmgr update --self --all --reinstall-forcibly-removed'

CONDA=$HOME/.local/anaconda/etc/profile.d/conda.sh
CONDA3=$HOME/.local/anaconda3/etc/profile.d/conda.sh
ROOT=$HOME/.local/root6/bin/thisroot.sh

for script in $CONDA $CONDA3 $ROOT; do
	if [ -f "$script" ]; then
		source "$script"
	fi
done


if type "envoy" > /dev/null; then
	source <(envoy -p)
fi

if type "pyenv" > /dev/null; then
	eval "$(pyenv init -)"
fi
