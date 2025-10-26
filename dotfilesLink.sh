#!/bin/sh
ln -sf ~/dotfiles/.bash_profile ~/.bash_profile
ln -sf ~/dotfiles/.bashrc ~/.bashrc
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ln -snf ~/dotfiles/.vim ~/.vim
ln -sf ~/dotfiles/dot_git/ignore ~/.config/git/ignore

# 大雑把にシンボリックリンクを探す
# sudo find ~ -type l -maxdepth 6 2>/dev/null | grep -vE "permitted|Containers|Cache|com\.|iCloud|apple|Google|Brave|jp\.naver|Homebrew|zoom|discord|Docker|docker|vim-lsp-settings|Rider\.app|rbenv|node|yarn|venv|veve|virtualenvs|dylib|SDL" > ~/dotfiles/find_symbolic_link.txt
