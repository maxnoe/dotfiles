export EDITOR=nvim
export BROWSER=firefox
export GOBIN=$HOME/.local/bin
export GTEST_COLOR=1
export OSTYPE=linux-gnu

alias vim=nvim
alias gits='git status -s'
alias ezrc='vim ~/.zshrc'

function szrc() {
	source $HOME/.zshenv
	source $HOME/.zshrc
	[ -f $HOME/.zlogin ] && source $HOME/.zlogin
}

alias updatetl='tlmgr update --self --all --reinstall-forcibly-removed'

CONDA=$HOME/.local/conda/etc/profile.d/conda.sh
ANACONDA=$HOME/.local/conda/etc/profile.d/conda.sh
CONDA3=$HOME/.local/anaconda3/etc/profile.d/conda.sh
ROOT=$HOME/.local/root6/bin/thisroot.sh

for script in $CONDA $ANACONDA $CONDA3 $ROOT; do
	if [ -f "$script" ]; then
		source "$script"
	fi
done


if type "pyenv" > /dev/null; then
	eval "$(pyenv init --path)"
	eval "$(pyenv init -)"
fi

if [ -x ruby ]; then
    export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
    export PATH="$PATH:$GEM_HOME/bin"
fi
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/go/bin:$PATH"

export PATH="$HOME/.local/texlive/2021/bin/x86_64-linux:$PATH"
export MANPATH="$HOME/.local/texlive/2021/texmf-dist/doc/man:$MANPATH"
export INFOPATH="$HOME/.local/texlive/2021/texmf-dist/doc/man:$INFOPATH"

# added by travis gem
[ ! -s /home/maxnoe/.travis/travis.sh ] || source /home/maxnoe/.travis/travis.sh
export GTEST_COLOR=1
export LANGUAGE=en_US
