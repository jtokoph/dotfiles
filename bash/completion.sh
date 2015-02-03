if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

_mosh ()
{
    COMPREPLY=()
    _known_hosts_real -a -- "$(_get_cword)"
} &&
complete -F _mosh mosh
