# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
##############
# HISTORY ####
##############
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
setopt INC_APPEND_HISTORY    # Add commands to HISTFILE incrementally
setopt EXTENDED_HISTORY      # Save timestamp and duration
unsetopt SHARE_HISTORY       # Don't share history between sessions
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first
setopt HIST_IGNORE_DUPS          # Don't record immediate duplicates
setopt HIST_IGNORE_SPACE         # Ignore commands that start with space
setopt HIST_VERIFY               # Don't execute immediately upon history expansion; when using !$, it will not run the command

setopt autocd notify

zstyle :compinstall filename '/home/siddarthg/.zshrc'
autoload -Uz compinit
compinit
## End of lines added by compinstall
#
### Plugins
source ~/powerlevel10k/powerlevel10k.zsh-theme

source /home/siddarthg/dotfiles/zshrc_plugin/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

source /home/siddarthg/dotfiles/zshrc_plugin/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
source /home/siddarthg/dotfiles/zshrc_plugin/zsh-history-substring-search/zsh-history-substring-search.zsh
HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=1

### Bindkeys
bindkey -e
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
echo -e '\e[5 q' ##enable cursor blink

## To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[[ ! -f ~/.zshrc_alias ]] || source ~/.zshrc_alias 

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
