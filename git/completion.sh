completion=/usr/local/etc/bash_completion.d/git-completion.bash

if [ -f $completion ]; then
  source $completion
  complete -o default -o nospace -F _git g
fi
