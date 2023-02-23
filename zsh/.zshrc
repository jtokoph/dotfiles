# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Enable homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Where are these files kept?
export DOTFILES=$HOME/.dotfiles

# Use the jtokoph theme
ZSH_THEME="jtokoph"
ZSH_CUSTOM=$DOTFILES/zsh/custom

# Case-sensitive completion.
CASE_SENSITIVE="true"

plugins=(
  git
  pj
  nvm
  gpg-agent
)

source $ZSH/oh-my-zsh.sh
