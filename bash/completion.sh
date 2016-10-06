if [ -f `brew --prefix`/etc/bash_completion ]; then

    DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/enabled_completions"

    export BASH_COMPLETION_DIR=$DIR
    export BASH_COMPLETION_COMPAT_DIR=$DIR

    # Create symlinks to files here: /usr/local/etc/bash_completion.d/*
    # pushd $DIR
    # ln -s /usr/local/etc/bash_completion.d/brew brew
    # ln -s /usr/local/etc/bash_completion.d/brew_bash_completion.sh
    # ln -s /usr/local/etc/bash_completion.d/coreutils
    # ln -s /usr/local/etc/bash_completion.d/git-completion.bash
    # ln -s /usr/local/etc/bash_completion.d/git-prompt.sh
    # ln -s /usr/local/etc/bash_completion.d/gpg
    # ln -s /usr/local/etc/bash_completion.d/gpg2
    # ln -s /usr/local/etc/bash_completion.d/gzip
    # ln -s /usr/local/etc/bash_completion.d/hub.bash_completion.sh
    # ln -s /usr/local/etc/bash_completion.d/mosh
    # ln -s /usr/local/etc/bash_completion.d/npm
    # ln -s /usr/local/etc/bash_completion.d/nvm
    # ln -s /usr/local/etc/bash_completion.d/openssl
    # ln -s /usr/local/etc/bash_completion.d/postgresql
    # ln -s /usr/local/etc/bash_completion.d/python
    # ln -s /usr/local/etc/bash_completion.d/screen
    # ln -s /usr/local/etc/bash_completion.d/sh
    # ln -s /usr/local/etc/bash_completion.d/sqlite3
    # ln -s /usr/local/etc/bash_completion.d/ssh
    # ln -s /usr/local/etc/bash_completion.d/tar
    # ln -s /usr/local/etc/bash_completion.d/unrar
    # ln -s /usr/local/etc/bash_completion.d/vagrant
    # popd
    . `brew --prefix`/etc/bash_completion
fi

_mosh ()
{
    COMPREPLY=()
    _known_hosts_real -a -- "$(_get_cword)"
} &&
complete -F _mosh mosh

complete -C aws_completer aws
