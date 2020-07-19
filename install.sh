#!/bin/bash

cd ~

# install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# install git
brew install git
git clone git@github.com:jfstn/.dotfiles.git

cat .dotfiles/brew/list.txt | while read line; do brew install $line; done
cat .dotfiles/brew/cask-list.txt | while read line; do brew install $line; done

# setup and linking
rm .zshrc
ln -s .dotfiles/zsh/.zshrc .zshrc
ln -s .dotfiles/git/.gitconfig .gitconfig
ln -s .dotfiles/tmux/.tmux.conf .tmux.conf

cp .dotfiles/zsh/theme/faustino.zsh-theme .oh-my-zsh/custom/themes

# oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"