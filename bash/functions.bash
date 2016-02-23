export CUSTOM_TITLE_SET=0
function title() {
    echo -n -e "\033]0;$@\007";
    export CUSTOM_TITLE="$@";
    export CUSTOM_TITLE_SET=1;
}

function pc() {
    if [ $CUSTOM_TITLE_SET == 0 ]; then
        LOCATION="$(basename `git rev-parse --show-toplevel 2> /dev/null` 2> /dev/null)"
        if [ $? == 1 ]; then
            LOCATION="$(basename $(pwd))"
        fi
        echo -n -e "\033]0;$LOCATION$(prompt_git)\007"
    else
        title $CUSTOM_TITLE
    fi
}

export PROMPT_COMMAND="$PROMPT_COMMAND pc; "

# Allow quick access to projects/sites
function s() {
    cd ~/Sites/$1
}

function _s() {
    local completions=`ls ~/Sites/`
    local word=${COMP_WORDS[COMP_CWORD]}
    COMPREPLY=( $( compgen -W "$completions" -- $word ))
    return 0
}

complete -F _s s

# Allow quick access to projects/sites
function b() {
    cd ~/Sites/blockspring/$1
}

function _b() {
    local completions=`ls ~/Sites/blockspring/`
    local word=${COMP_WORDS[COMP_CWORD]}
    COMPREPLY=( $( compgen -W "$completions" -- $word ))
    return 0
}

complete -F _b b



# credit: http://nparikh.org/notes/zshrc.txt
# Usage: smartextract <file>
# Description: extracts archived files / mounts disk images
# Note: .dmg/hdiutil is Mac OS X-specific.
function smartextract () {
    if [ -f $1 ]; then
        case $1 in
            *.tar.bz2)  tar -jxvf $1                        ;;
            *.tar.gz)   tar -zxvf $1                        ;;
            *.bz2)      bunzip2 $1                          ;;
            *.dmg)      hdiutil mount $1                    ;;
            *.gz)       gunzip $1                           ;;
            *.tar)      tar -xvf $1                         ;;
            *.tbz2)     tar -jxvf $1                        ;;
            *.tgz)      tar -zxvf $1                        ;;
            *.zip)      unzip $1                            ;;
            *.ZIP)      unzip $1                            ;;
            *.pax)      cat $1 | pax -r                     ;;
            *.pax.Z)    uncompress $1 --stdout | pax -r     ;;
            *.Z)        uncompress $1                       ;;
            *.rar)      unrar x $1                          ;;
            *)          echo "'$1' cannot be extracted/mounted via smartextract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# open new tab with same path
function nt () {
    pwd=`pwd`
    osascript -e "tell application \"Terminal\"" \
        -e "tell application \"System Events\" to keystroke \"t\" using {command down}" \
        -e "do script \"cd $pwd; clear\" in front window" \
        -e "end tell" > /dev/null
}

function whoisc() {
    open http://whois.sc/$1
}

# Create a new directory and enter it
function mkd() {
    mkdir -p "$@" && cd "$_";
}

# Create a data URL from a file
function dataurl() {
    local mimeType=$(file -b --mime-type "$1");
    if [[ $mimeType == text/* ]]; then
        mimeType="${mimeType};charset=utf-8";
    fi
    echo "data:${mimeType};base64,$(openssl base64 -in "$1" | tr -d '\n')";
}
