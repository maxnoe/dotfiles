export EDITOR=nvim
export BROWSER=firefox
export GOBIN=$HOME/.local/bin
export GTEST_COLOR=1
export OSTYPE=linux-gnu
export max_print_line=2147483647

alias vim=nvim
alias gits='git status -s'
alias ezrc='vim ~/.zshrc'

function szrc() {
	source $HOME/.zshenv
	source $HOME/.zshrc
	[ -f $HOME/.zlogin ] && source $HOME/.zlogin
}

alias updatetl='tlmgr update --self --all --reinstall-forcibly-removed'

init_scripts=(
	$HOME/.local/conda/etc/profile.d/conda.sh
	$HOME/.local/conda/etc/profile.d/mamba.sh
	$HOME/.local/root6/bin/thisroot.sh
	$HOME/.cargo/env
    $HOME/.rvm/scripts/rvm
)

for script in $init_scripts; do
	if [ -f "$script" ]; then
		source "$script"
	fi
done

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/node/bin:$PATH"
export PATH="$HOME/.local/go/bin:$PATH"
export PATH="$HOME/.local/cmake/bin:$PATH"

export PATH="$HOME/.local/texlive/2024/bin/x86_64-linux:$PATH"
export MANPATH="$HOME/.local/texlive/2024/texmf-dist/doc/man:$MANPATH"
export INFOPATH="$HOME/.local/texlive/2024/texmf-dist/doc/man:$INFOPATH"

# added by travis gem
export GTEST_COLOR=1
export LANGUAGE=en_US
export GAMMAPY_DATA="$HOME/Projects/gammapy/gammapy-datasets/dev"
export max_print_line=2147483647
export CMAKE_GENERATOR=Ninja
export CMAKE_EXPORT_COMPILE_COMMANDS=ON
export CMAKE_COLOR_DIAGNOSTICS=ON
