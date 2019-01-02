if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin directories
export PATH="$HOME/.gem/ruby/2.5.0/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/go/bin:$PATH"

export PATH="$HOME/.local/texlive/2018/bin/x86_64-linux:$PATH"
export MANPATH="$HOME/.local/texlive/2018/texmf-dist/doc/man:$MANPATH"
export INFOPATH="$HOME/.local/texlive/2018/texmf-dist/doc/man:$INFOPATH"

if [ -f "$HOME/.local/root6/bin/thisroot.sh" ];
then
	source "$HOME/.local/root6/bin/thisroot.sh"
fi

