export EDITOR='nvim'
export BROWSER=google-chrome-stable

alias vim=nvim
alias gits='git status -s'
alias godark="source ~/.config/base16-shell/scripts/base16-default-dark.sh"
alias golight="source ~/.config/base16-shell/scripts/base16-default-light.sh"
godark

alias ezrc='vim ~/.zshrc'
alias szrc='source ~/.zshrc'

alias updatetl='tlmgr update --self --all --reinstall-forcibly-removed'

if [ -f ~/.local/root6/bin/thisroot.sh ]; then
	source ~/.local/root6/bin/thisroot.sh
fi

export GAMMALIB=$HOME/.local/gammalib
if [ -f $GAMMALIB/bin/gammalib-init.sh ]; then
	source $GAMMALIB/bin/gammalib-init.sh
fi
export CTOOLS=$HOME/.local/ctools
if [ -f $CTOOLS/bin/ctools-init.sh ]; then
	source $CTOOLS/bin/ctools-init.sh
fi

if type "envoy" > /dev/null; then
	source <(envoy -p)
fi
