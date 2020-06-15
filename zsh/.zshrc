export DEFAULT_USER=maxnoe

SAVEHIST=10000
HISTFILE=~/.zsh_history
HIST_STAMPS="yyyy-mm-dd"

BASE16_SHELL="$HOME/.config/base16-shell"
[ -n "$PS1" ] \
	&& [ -s "$BASE16_SHELL/profile_helper.sh" ] \
	&& eval "$("$BASE16_SHELL/profile_helper.sh")" \
	&& source "$BASE16_SHELL/scripts/base16-default-dark.sh"

eval $(dircolors $HOME/.dircolors)
source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
