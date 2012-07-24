# Show git branch
PS1='\[\033[1;33m\]\h\[\033[0;37m\]:\[\033[1;34m\]\W\[\033[1;32m\]$(__git_ps1 " (%s)")\[\033[1;31m\] · \[\033[0m\]'

export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWSTASHSTATE=1

# Always wait
export EDITOR="mate -w -l"

export CLICOLOR=1
