export PATH="$HOME/.gem/ruby/2.4.0/bin:$PATH"
export PATH="$HOME/.local/anaconda3/bin:$PATH"
export PATH="$HOME/.local/texlive/2017/bin/x86_64-linux:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/go/bin:$PATH"

if [ -f "$HOME/.local/root6/bin/thisroot.sh" ];
then
	source "$HOME/.local/root6/bin/thisroot.sh"
fi

export MANPATH="$HOME/.local/texlive/2016/texmf-dist/doc/man:$MANPATH"
export INFOPATH="$HOME/.local/texlive/2016/texmf-dist/doc/man:$INFOPATH"
