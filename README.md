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

### Features in the ZSH

Zsh Directory Stack

Zsh has commands to push and pop directories on a directory stack.

By manipulating this stack, you can set up an history of directory visited, and be able to jump back to these directories.

First, let’s set some options in your .zshrc:

setopt AUTO_PUSHD           # Push the current directory visited on the stack.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.

Then, you can create these aliases:

alias d='dirs -v'
for index ({1..9}) alias "$index"="cd +${index}"; unset index

What does it do?

    Every directory visited will populate the stack.
    When you use the alias d, it will display the directories on the stack prefixed with a number.
    The line for index ({1..9}) alias "$index"="cd +${index}"; unset index will create aliases from 1 to 9. They will allow you to jump directly in whatever directory on your stack.

For example, if you execute 1 in Zsh, you’ll jump to the directory prefixed with 1 in your stack list.

You can also increase index ({1..9}) to index ({1..100}) for example, if you want to be able to jump back to 100 directories.

For example, you can do that:

~ > cd .config
~/.config > cd devdash
~/.config/devdash > cd ..
~/.config > cd i3
~/.config/i3 > cd ..
~/.config > d
0       ~/.config
1       ~/.config/i3
2       ~/.config/devdash
3       ~
~/.config > 2
~/.config/devdash > 


###Jumping To A Parent Directory Easily

Do you like to type cd ../../.. to come back to the great-grand-parent of the current folder?

Me neither.

It’s where bd can help you. Imagine that you’re in the folder ~/a/b/c/d. You can jump directly to a with the command bd a.

The Zsh completion is even included. Awesomeness!

To use it, you need to source the file bd.zsh.



###########################################################################################################################################

# ToDo
3. Learn about vi-mode
4. learn about lua.init, how to modify nbim to add all the functionality
6. Install :
7.     Zinit
8.     https://github.com/jeffreytse/zsh-vi-mode
9.     Zoxide using https://www.youtube.com/watch?v=aghxkpyRVDY
10.     stow using https://www.youtube.com/watch?v=y6XCebnB9gs

## NVIM 
https://github.com/alvarojsino813/nvim-config-guide
https://vim.rtorr.com/
https://builtin.com/software-engineering-perspectives/neovim-configuration
https://github.com/jeffreytse/zsh-vi-mode
