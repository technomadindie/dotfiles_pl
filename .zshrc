# ================================
# Powerlevel10k Instant Prompt
# ================================
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ================================
# Zinit Configuration
# ================================
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"
# ================================
# Load Custom Aliases
# ================================
[[ ! -f ~/.zshrc_alias_personal ]] || source ~/.zshrc_alias_personal 
[[ ! -f ~/.zshrc_alias_nv ]] || source ~/.zshrc_alias_nv

# ================================
# Welcome Message
# ================================
echo "Welcome $USER! Hope you have a good day!"

# ================================
# Zinit Plugins
# ================================
# Add Powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Add zsh plugins
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions 
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-history-substring-search
zinit light Aloxaf/fzf-tab
zinit ice depth=1; zinit light jeffreytse/zsh-vi-mode


zinit ice atclone"dircolors -b LS_COLORS > clrs.zsh" \
    atpull'%atclone' pick"clrs.zsh" nocompile'!' \
    atload'zstyle ":completion:*" list-colors “${(s.:.)LS_COLORS}”'
zinit light trapd00r/LS_COLORS

zinit ice as"command" from"gh-r" mv"bat* -> bat" pick"bat/bat"
zinit light sharkdp/bat
# ================================
# Plugins Custom Settings
# ================================
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=1

# ================================
# Autoload and Compinit
# ================================
autoload -Uz compinit; compinit -u
comp_options+=(globdots) # With hidden files

# ================================
# History Settings
# ================================
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

# ================================
# Directory Navigation
# ================================
setopt autocd notify
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# ================================
# Auto-Pushd Settings
# ================================
setopt AUTO_PUSHD           # Push the current directory visited on the stack.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.
zmodload zsh/complist

# ================================
# Key Bindings
# ================================
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

# ================================
# FZF Setup
# ================================
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_TMUX=1
export FZF_TMUX_OPTS='-p80%,60%'
export FZF_CTRL_T_COMMAND="fd --type f --hidden --exclude .git"
export FZF_CTRL_T_OPTS="--preview '/home/utils/bat-0.23.0/bin/bat --style=numbers --color=always --line-range :500 {}'"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
alias cool-find='fd --type f --hidden --exclude .git | fzf-tmux -p --reverse | xargs nvim'

# ================================
# FZF-TAB Setup
# ================================
zstyle ':completion:*:git-checkout:*' sort false
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu no
zstyle ':fzf-tab:*' switch-group '<' '>'
zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup
zstyle ':completion:*:*:*:*' ignored-patterns 'p4'
POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
