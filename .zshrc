#zmodload zsh/zprof

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

echo "Welcome $USER! Hope you have a good day!"
## To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[[ ! -f ~/.zshrc_alias_personal ]] || source ~/.zshrc_alias_personal 
[[ ! -f ~/.zshrc_alias_nv ]] || source ~/.zshrc_alias_nv

###########
##fzf setup
###########
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_TMUX=1
export FZF_TMUX_OPTS='-p80%,60%'
# CTRL-T - Paste the selected file path(s) into the command line
export FZF_CTRL_T_COMMAND="fd --type f --hidden --exclude .git"
export FZF_CTRL_T_OPTS="--preview '/home/utils/bat-0.23.0/bin/bat --style=numbers --color=always --line-range :500 {}'"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
#export FZF_DEFAULT_OPTS="--height=40% --layout=reverse --info=inline --preview 'cat {}' --border --margin=1 --padding=1"
alias cool-find='fd --type f --hidden --exclude .git | fzf-tmux -p --reverse | xargs nvim'

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
zstyle ':completion:*' menu select
#############
# cd into any directory
#############
### directories will be in stack; use option 'd' to go into any directory
setopt AUTO_PUSHD           # Push the current directory visited on the stack.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.


zmodload zsh/complist
zstyle :compinstall filename '/home/siddarthg/.zshrc'

autoload -U compinit; compinit
_comp_options+=(globdots) # With hidden files

## End of lines added by compinstall
#
### Plugins
source ~/zshrc_plugin/powerlevel10k/powerlevel10k.zsh-theme

source ~/zshrc_plugin/fzf-tab/fzf-tab.zsh ## show tabs automatically ; Must be before zsh-autosuggestions;
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
bindkey "^?" backward-delete-char ## To use backspace to delete words after insertmode->normalmode->insertmode
## Edit command line commands in $EDITOR
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

#######
# FZF-TAB Setup
#######
# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
# NOTE: don't use escape sequences here, fzf-tab will ignore them
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# force zsh not to show completion menu, which allows fzf-tab to capture the unambiguous prefix
zstyle ':completion:*' menu no
#zstyle ':fzf-tab:complete:cd:*' fzf-preview 'tree'
# switch group using `<` and `>`
zstyle ':fzf-tab:*' switch-group '<' '>'
zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup

#zprof
