#zmodload zsh/zprof

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

echo "Welcome $USER! Hope you have a good day!"
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

#############
# cd into any directory
#############
### directories will be in stack; use option 'd' to go into any directory
setopt AUTO_PUSHD           # Push the current directory visited on the stack.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.


zstyle :compinstall filename '/home/siddarthg/.zshrc'
autoload -Uz compinit
compinit
## End of lines added by compinstall
#
### Plugins
source ~/zshrc_plugin/powerlevel10k/powerlevel10k.zsh-theme

source ~/zshrc_plugin/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

source ~/zshrc_plugin/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
source ~/zshrc_plugin/zsh-history-substring-search/zsh-history-substring-search.zsh
HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=1

source ~/zshrc_plugin/cursor_mode_vim ##cursor mode for vim
source ~/zshrc_plugin/bd.zsh ## if you are in /a/b/c/d/e/t ; you can directly jump to a using "bd a"
### Bindkeys
bindkey -v
export KEYTIMEOUT=1
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
echo -e '\e[5 q' ##enable cursor blink
echo -ne '\e]12;#FF0000\a' # Change cursor color to red
## To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[[ ! -f ~/.zshrc_alias_personal ]] || source ~/.zshrc_alias_personal 
[[ ! -f ~/.zshrc_alias_nv ]] || source ~/.zshrc_alias_nv

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#zprof
