#!/bin/bash

# Create the zshrc_plugin directory if it doesn't exist
mkdir -p ~/zshrc_plugin

# Clone fzf and install it
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all

# Clone zsh plugins
#git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/zshrc_plugin/zsh-syntax-highlighting
#echo "###################################################  zsh-syntax-highlighting search installation completed successfully!################################################### "
#git clone https://github.com/zsh-users/zsh-history-substring-search ~/zshrc_plugin/zsh-history-substring-search 
#echo " ################################################### zsh-substring search installation completed successfully!################################################### "
#git clone https://github.com/zsh-users/zsh-autosuggestions ~/zshrc_plugin/zsh-autosuggestions
#echo "################################################### zsh-autosuggestions installation completed successfully!################################################### "
#git clone --depth=1 https://github.com/romkatv/powerlevel10k.git  ~/zshrc_plugin/powerlevel10k
#echo "###################################################  Powerlevel10k installation completed successfully!################################################### "
#git clone https://github.com/Aloxaf/fzf-tab.git ~/zshrc_plugin/fzf-tab
#echo "###################################################  FZF-TAB installation completed successfully!################################################### "
echo "Installation completed successfully!"
