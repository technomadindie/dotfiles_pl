git clone git@github.com:technomadindie/dotfiles_pl.git

All the below steps are now done using script
first run symlink script
chmod +777 sym_link_generator.sh

then chmod +777 plugin_install.sh
Steps:
1. Go to home using "cd "
2. ln -s <original_path> .zshrc | all the files like this
3. cd dotfiles_pl , and run
""
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git zshrc_plugin/zsh-syntax-highlighting

git clone https://github.com/zsh-users/zsh-history-substring-search zshrc_plugin/zsh-history-substring-search 

git clone https://github.com/zsh-users/zsh-autosuggestions zshrc_plugin/zsh-autosuggestions
