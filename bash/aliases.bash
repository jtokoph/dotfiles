# some from https://github.com/mathiasbynens/dotfiles/blob/master/.aliases

# Reload config
alias rl='source ~/.bash_profile'

# Grep for processes
alias psg="ps aux | grep $1"

# Files
alias ll="ls -la"
alias ..="cd .."
alias ...="cd ../.."

# SSH aliases
alias ssh="ssh -A"
alias sshq='ssh -o "UserKnownHostsFile /dev/null" -o "StrictHostKeyChecking no"'

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en1"
alias ips="ifconfig -a | grep -o 'inet6\? \(\([0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+\)\|[a-fA-F0-9:]\+\)' | sed -e 's/inet6* //'"

# All the dig info
alias dig="dig +nocmd any +multiline +noall +answer"

# Enhanced WHOIS lookups
#alias whois="whois -h whois-servers.net"

# Flush Directory Service cache
alias flush="dscacheutil -flushcache"

# Trim new lines and copy to clipboard
alias c="tr -d '\n' | pbcopy"

# URL-encode strings
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'

# Updates
alias update='brew update; brew upgrade; npm -g update; npm update'

# One of @janmoesen’s ProTip™s
for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do
    alias "$method"="lwp-request -m '$method'"
done

# simple whois-servers
alias server='python -m SimpleHTTPServer '

alias activate='. .venv/bin/activate'

function tab {
  # Will cd into current dir if called without arg.
  osascript -e 'tell application "Terminal"' \
            -e 'tell application "System Events" to keystroke "t" using {command down}' \
            -e "do script \"cd `pwd` && cd ${1-.} && clear\" in front window" \
            -e 'end tell' > /dev/null
}
alias t='tab'

# Shortcuts
alias g="git"
alias v="vim"
alias a="atom"

# disable history file writing for this session
alias incog='unset HISTFILE'

alias bsa="atom ~/Sites/blockspring/juicebox ~/Sites/blockspring/nodebox-sender ~/Sites/blockspring/nodebox-receiver ~/Sites/blockspring/script-run-service"
