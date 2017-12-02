### Added by the Heroku Toolbelt
export PATH=$PATH:/usr/local/heroku/bin

export GOPATH=~/go
#export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOPATH/bin

# Removed old npm path /usr/local/share/npm/bin:
export PATH=$HOME/.dotfiles/bin:$HOME/bin:/usr/local/sbin:/usr/local/bin:$PATH

# This was slow, not needed with rvm?
#export PATH=$(brew --prefix ruby)/bin:$PATH
export PATH=./bin:$PATH

# This was slow, not needed anymore? http://dave.cheney.net/2013/06/14/you-dont-need-to-set-goroot-really
#export GOROOT=`go env GOROOT`

# brew python
export PATH="/usr/local/opt/python/libexec/bin:$PATH"
