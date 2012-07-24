export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWSTASHSTATE=1

# Always wait
export EDITOR="mate -w -l"

export CLICOLOR=1

# @gf3’s Sexy Bash Prompt, inspired by “Extravagant Zsh Prompt”
# Shamelessly copied from https://github.com/gf3/dotfiles
# Screenshot: http://i.imgur.com/s0Blh.png

RED="\033[1;31m"
ORANGE="\033[1;33m"
GREEN="\033[1;32m"
PURPLE="\033[1;35m"
WHITE="\033[1;37m"
BOLD=""
RESET="\033[m"
YELLOW="\033[1;33m"
BLUE="\033[1;34m"
GREEN="\033[1;32m"
export RED
export ORANGE
export GREEN
export PURPLE
export WHITE
export YELLOW
export BLUE
export BOLD
export RESET

export PS1="\[$YELLOW\]\h\[$WHITE\]:\[$BLUE\]\W\[$GREEN\]\$(__git_ps1 \" (%s)\")\[$RED\] · \[$RESET\]"
export PS2="\[$ORANGE\]→ \[$RESET\]"