#!/usr/bin/env bash

fancy_echo() {
  local fmt="$1"; shift
  printf "\n$fmt\n" "$@"
}

fancy_echo "Installing Git, and other utilities ..."
brew install \
    docker \
    docker-compose \
    git \
    vim \
    tree \
    bat \
    exa \
    python \
    tldr \
    n \
    fzf

fancy_echo "Installing Applications ..."
brew install --cask \
    alfred \
    iterm2 \
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
    notion \
    postico \
    opera \
    vlc \
    citrix-workspace \
    zoom


# make cache folder (if missing) and take ownership
sudo mkdir -p /usr/local/n
sudo chown -R $(whoami) /usr/local/n
# make sure the required folders exist (safe to execute even if they already exist)
sudo mkdir -p /usr/local/bin /usr/local/lib /usr/local/include /usr/local/share
# take ownership of Node.js install destination folders
sudo chown -R $(whoami) /usr/local/bin /usr/local/lib /usr/local/include /usr/local/share


fancy_echo "Vim Setup ..."
git clone https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

fancy_echo "Git Setup..."
sudo cp ./.gitignore ~/.gitignore
sudo cp ./.gitconfig ~/.gitconfig
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
cat ~/.ssh/id_ed25519.pub

fancy_echo "Key coppied (I hope), paste it in GH"
pbcopy < ~/.ssh/id_ed25519.pub
