#!/usr/bin/env bash

fancy_echo() {
  local fmt="$1"; shift
  printf "\n$fmt\n" "$@"
}

fancy_echo "Installing xcode ..."
xcode-select --install

fancy_echo "Installing Homebrew ..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

fancy_echo "Instal Rosetta and Docker"
softwareupdate --install-rosetta
brew install docker docker-compose

fancy_echo "Installing iTerm2 ..."
brew install --cask iterm2

fancy_echo "Installing n ..."
brew install n

fancy_echo "Installing ohmyzsh ..."
brew install zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
chsh -s $(which zsh)
source ~/.zshrc

fancy_echo "Installing Git, and other utilities ..."
brew install \
    git \
    vim \
    tree \
    bat \
    exa \
    python \
    tldr \
    fzf

fancy_echo "Installing Applications ..."
brew install --cask \
    alfred \
    1password \
    1password-cli \
    imageoptim \
    visual-studio-code \
    google-chrome \
    jetbrains-toolbox\
    caffeine \
    sublime-text \
    firefox \
    rectangle \
    discord \
    slack \
    spotify \
    postgres \
    notion \
    postico \
    bear \
    opera \
    vlc \
    zoom \
    todoist


fancy_echo "Vim Setup ..."
git clone https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

fancy_echo "Git Setup..."
cp ./.gitignore ~/.gitignore
cp ./.gitconfig ~/.gitconfig
git config --global core.excludesfile ~/.gitignore


read -p "Enter your Frist and Last name for Git: " name

read -p "Enter your email to generate ssh key: " email
git config --global user.name "$name"
git config --global user.email "$email"

fancy_echo "Generating SSH key"
ssh-keygen -t ed25519 -q -N "" -C "$email"
eval "$(ssh-agent -s)"
cp ./config ~/.ssh/config
ssh-add -K ~/.ssh/id_ed25519
cat ~/.ssh/id_ed25519

fancy_echo "Key coppied (I hope), paste it in GH"
pbcopy < ~/.ssh/id_ed25519