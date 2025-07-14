#!/bin/zsh

# Install homebrew if not installed
if ! command -v brew &> /dev/null; then
  echo "Installing homebrew"
  curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
else
  echo "Homebrew is already installed"
fi

# Install stow if not installed
if ! command -v stow &> /dev/null; then
  echo "Installing stow"
  brew install stow
else
  echo "Stow is already installed"
fi

BREW_PACKAGES=(
  asdf
  bat
  eza
  fzf
  git
  stow
  font-hack-nerd-font
  zoxide
)

brew install $BREW_PACKAGES

# Run stow to make the symlinks
stow -d ${HOME}/dotfiles -t ${HOME} .

asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git

asdf install nodejs latest
