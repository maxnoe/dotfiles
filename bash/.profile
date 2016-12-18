if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin directories
export PATH="$HOME/bin:$HOME/.local/bin:$PATH"


export PATH="$HOME/.gem/ruby/2.3.0/bin:$PATH"
export PATH="$HOME/.local/anaconda3/bin:$PATH"
export PATH="$HOME/.local/texlive/2016/bin/x86_64-linux:$PATH"
export PATH="$HOME/.local/bin:$PATH"

if [ -f "$HOME/.local/root6/bin/thisroot.sh" ];
then
	source "$HOME/.local/root6/bin/thisroot.sh"
fi

export MANPATH="$HOME/.local/texlive/2016/texmf-dist/doc/man:$MANPATH"
export INFOPATH="$HOME/.local/texlive/2016/texmf-dist/doc/man:$INFOPATH"
