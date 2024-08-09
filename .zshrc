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
# Autoload and Compinit
# ================================
zmodload zsh/complist
autoload -Uz compinit; compinit -u
comp_options+=(globdots) # With hidden files

# ================================
# Zinit Configuration
# ================================
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
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
zinit light Aloxaf/fzf-tab
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions 
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-history-substring-search
#zinit ice depth=1; zinit light jeffreytse/zsh-vi-mode

zinit ice atclone"dircolors -b LS_COLORS > clrs.zsh" \
    atpull'%atclone' pick"clrs.zsh" nocompile'!' \
    atload'zstyle ":completion:*" list-colors “${(s.:.)LS_COLORS}”'
zinit light trapd00r/LS_COLORS

#zinit ice as"command" from"gh-r" mv"bat* -> bat" pick"bat/bat"
#zinit light sharkdp/bat

# ================================
# Plugins Custom Settings
# ================================
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=1
#ZVM_INSERT_MODE_CURSOR=$ZVM_CURSOR_BEAM
#ZVM_NORMAL_MODE_CURSOR=$ZVM_CURSOR_BLOCK
#ZVM_OPPEND_MODE_CURSOR=$ZVM_CURSOR_UNDERLINE

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

# ================================
# Key Bindings
# ================================
## Choose -v : vi-mode
## Choose -e : emacs-mode
#bindkey -v
bindkey -e
export KEYTIMEOUT=1
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
echo -e '\e[5 q' ##enable cursor blink
echo -ne '\e]12;#FF0000\a' # Change cursor color to red
bindkey "^?" backward-delete-char ## To use backspace to delete words after insertmode->normalmode->insertmode

# ================================
# When in vi-mode 
# ================================
### Edit command line commands in $EDITOR
#autoload -Uz edit-command-line
#zle -N edit-command-line
#bindkey -M vicmd v edit-command-line
#source ~/zshrc_plugin/cursor_mode_vim ##cursor mode for vim

# ================================
# When in emacs-mode 
# ================================
# Function to set cursor shape
function set_cursor_shape() {
    local shape=$1
    case $shape in
        beam) echo -ne '\e[5 q';;
        block) echo -ne '\e[1 q';;
        underline) echo -ne '\e[3 q';;
    esac
}

# Set beam shape cursor on startup
set_cursor_shape beam

# Load and modify edit-command-line widget
autoload -Uz edit-command-line

edit-command-line-wrapper() {
    edit-command-line
    set_cursor_shape beam
    zle reset-prompt
    zle -R
}

zle -N edit-command-line-wrapper
bindkey '^X^E' edit-command-line-wrapper

# Reset cursor shape before each prompt
precmd() {
    set_cursor_shape beam
}

# Reset cursor shape before executing a command
preexec() {
    set_cursor_shape beam
}

# Load add-zsh-hook
autoload -Uz add-zsh-hook

# Add hooks
add-zsh-hook precmd precmd
add-zsh-hook preexec preexec
# Keybindings for Home and End keys
bindkey '^[[H' beginning-of-line  # Home key
bindkey '^[[F' end-of-line        # End key

# Alternative keybindings (some terminals might use these)
bindkey '^[[1~' beginning-of-line
bindkey '^[[4~' end-of-line

# For some xterm
bindkey '^[[7~' beginning-of-line
bindkey '^[[8~' end-of-line
# ================================
# FZF Setup
# ================================
source ~/.fzf.zsh
source ~/.fzf/shell/completion.zsh
source ~/.fzf/shell/key-bindings.zsh
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
#zstyle ':fzf-tab:*' switch-group '<' '>'
#zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup
zstyle ':completion:*:*:*:*' ignored-patterns 'p4'
zstyle ':fzf-tab:complete:cd*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:ls*' fzf-preview 'ls --color $realpath'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source ~/zshrc_plugin/bd.zsh ## if
