export CUSTOM_TITLE_SET=0
function title() {
    echo -n -e "\033]1;$@\007";
    export CUSTOM_TITLE="$@";
    export CUSTOM_TITLE_SET=1;
}

function pc() {
    if [ $CUSTOM_TITLE_SET == 0 ]; then
        echo -n -e "\033]1;`hostname | sed 's/\..*//'`\007";
    else
        title $CUSTOM_TITLE
    fi
}

export PROMPT_COMMAND='pc'

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
