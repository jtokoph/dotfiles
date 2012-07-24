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