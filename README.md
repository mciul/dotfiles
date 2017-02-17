[copied from shelmire]

Update vim on mac to newest version:

brew install vim --with-system-override-vim

Requires installation of Vundle (https://github.com/VundleVim/Vundle.vim) for vim.

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

Create symlinks:

ln -s dotfiles/bashrc .bashrc

ln -s dotfiles/vimrc .vimrc

ln -s dotfiles/tmux.conf .tmux.conf

mkdir -p .vim

ln -s vim_plugin .vim/plugin

Open Vim and run :PluginInstall
