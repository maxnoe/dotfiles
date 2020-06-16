# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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
prompt powerlevel10k

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
