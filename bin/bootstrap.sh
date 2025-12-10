#!/bin/zsh

echo "Preparing sudo"
sudo true

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
  git-delta
  eza
  fzf
  git
  stow
  font-hack-nerd-font
  zoxide
  kanata
)

brew install $BREW_PACKAGES

# Run stow to make the symlinks
stow -d ${HOME}/dotfiles -t ${HOME} .

asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git

asdf install nodejs latest

# Install Karabini-DriverKit-VirtualHIDDevice
curl -L -o ${HOME}/Downloads/Karabiner-DriverKit-VirtualHIDDevice-6.1.0.pkg https://github.com/pqrs-org/Karabiner-DriverKit-VirtualHIDDevice/releases/download/v6.1.0/Karabiner-DriverKit-VirtualHIDDevice-6.1.0.pkg

sudo installer -pkg ${HOME}/Downloads/Karabiner-DriverKit-VirtualHIDDevice-6.1.0.pkg -target /

/Applications/.Karabiner-VirtualHIDDevice-Manager.app/Contents/MacOS/Karabiner-VirtualHIDDevice-Manager activate

echo "Make sure to drag the kanata binary to Input Monitoring https://github.com/jtroo/kanata/issues/1211#issuecomment-2327141671 and https://github.com/jtroo/kanata/discussions/1537"

# Setup LaunchDaemons
# sudo stow -d ${HOME}/dotfiles/LaunchDaemons -t /Library/LaunchDaemons .

for file in ${HOME}/dotfiles/LaunchDaemons/*; do
  echo "Setting up ${file}"
  servicename=$(basename ${file} .plist)
  filename="${servicename}.plist"
  echo "Filename: ${filename}"
  echo "Service name: ${servicename}"
  sudo cp ${file} /Library/LaunchDaemons/
  sudo launchctl load /Library/LaunchDaemons/${filename}
  sudo launchctl start ${servicename}
done
