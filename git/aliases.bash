alias git='hub'
alias g='git'
alias gl='git pull --prune'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gd='git diff'
alias gc='git commit'
alias gca='git commit -a'
alias gco='git checkout'
alias gb='git branch'
alias gs='git status -sb'
alias grm="git status | grep deleted | awk '{print \$3}' | xargs git rm"

# Cleaning local repo
alias cleanup-branches="git fetch; git branch --merged master | sed 's/ //g' | grep -v '*' | grep -v 'master$' | xargs git branch -d"
alias cleanup-remote-branches="git fetch; git remote prune origin; git branch -r --merged origin/master | sed 's/ //g' | grep -v '*' | grep -v 'master$' | grep origin | sed 's/origin\///g' | xargs git push origin --delete"
alias cleanup-deleted-clipboard-files="git ls-files --deleted| xargs git rm"

# Open pull request
function currepo() {
    git config --get remote.origin.url | sed 's/.*@\(.*\)/\1/' | sed 's/\(.*\):\(.*\)/\1\/\2/' | sed 's/\(.*\)\.git/\1/';
}
function curbranch() {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/';
}
alias openpr="open https://\`currepo\`/pull/new/\`curbranch\`"
