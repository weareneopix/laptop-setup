# Install Steps

1. Install XCode (takes time)
```bash
xcode-select --install
```

2. Install Brew
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
# After finished
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
```

3. Install Rosetta
```bash
softwareupdate --install-rosetta
```

4. Install ZSH and OhMyZsh
```bash
brew install zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
chsh -s $(which zsh)
source ~/.zshrc
```

5. Run install script
```bash
chmod +x ./start.sh
./start.sh
```