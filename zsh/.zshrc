# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export DEFAULT_USER=maxnoe
setopt no_share_history

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

# equivalent to vim's smartcase
zstyle ':completion:*'  matcher-list 'm:{a-z}={A-Z}'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

function open () {
	# raise an error if the argument does not exist and is not a link
	if [[ "$1" != http*//* && "$1" != www.* && ! -a "$1" ]]; then
		echo "No such file or directory $1" 1>&2
		return 1
	fi

	nohup xdg-open $1 < /dev/null 2>/dev/null >/dev/null &!
}
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

scroll-and-clear-screen() {
  local i=1
  while read; do ((i++)); done <<< $PS1
  printf '\n%.0s' {$i..$LINES}
  zle clear-screen
}
zle -N scroll-and-clear-screen
bindkey '^l' scroll-and-clear-screen

alias rg='kitty +kitten hyperlinked_grep'

unsetopt BEEP
unsetopt LIST_BEEP
alias locate='noglob plocate'
