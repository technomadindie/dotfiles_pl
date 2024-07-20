#!/bin/bash

# Create the zshrc_plugin directory if it doesn't exist
mkdir -p ~/zshrc_plugin

# Clone fzf and install it
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all

# Clone zsh plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/zshrc_plugin/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-history-substring-search ~/zshrc_plugin/zsh-history-substring-search 
git clone https://github.com/zsh-users/zsh-autosuggestions ~/zshrc_plugin/zsh-autosuggestions

echo "Installation completed successfully!"
