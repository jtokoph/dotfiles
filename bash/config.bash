#export GIT_PS1_SHOWDIRTYSTATE=1
#export GIT_PS1_SHOWUNTRACKEDFILES=1
#export GIT_PS1_SHOWSTASHSTATE=1

# Always wait
export EDITOR="atom -w"

export HISTSIZE=4000
export HISTFILESIZE=4000

export CLICOLOR=1

# @gf3’s Sexy Bash Prompt, inspired by “Extravagant Zsh Prompt”
# Shamelessly copied from https://github.com/gf3/dotfiles
# Screenshot: http://i.imgur.com/s0Blh.png

RED="\033[1;31m"
GREEN="\033[1;32m"
PURPLE="\033[1;35m"
WHITE="\033[1;37m"
BOLD=""
RESET="\033[m"
YELLOW="\033[1;33m"
BLUE="\033[1;34m"
GREEN="\033[1;32m"
export RED
export GREEN
export PURPLE
export WHITE
export YELLOW
export BLUE
export BOLD
export RESET


# This prompt inspired by gf3, sindresorhus, alrra, and mathiasbynens.
# but customized to me. <3

default_username='jtokoph'

if [[ $COLORTERM = gnome-* && $TERM = xterm ]] && infocmp gnome-256color >/dev/null 2>&1; then
    export TERM=gnome-256color
elif infocmp xterm-256color >/dev/null 2>&1; then
    export TERM=xterm-256color
fi


set_prompts() {

    local black="" blue="" bold="" cyan="" green="" orange="" \
          purple="" red="" reset="" white="" yellow=""

    local dateCmd=""

    if [ -x /usr/bin/tputDISABLE ] && tput setaf 1 &> /dev/null; then

        tput sgr0 # Reset colors

        bold=$(tput bold)
        reset=$(tput sgr0)

        # Solarized colors
        # (https://github.com/altercation/solarized/tree/master/iterm2-colors-solarized#the-values)
        black=$(tput setaf 0)
        blue=$(tput setaf 33)
        cyan=$(tput setaf 37)
        green=$(tput setaf 190)
        orange=$(tput setaf 172)
        purple=$(tput setaf 141)
        red=$(tput setaf 124)
        violet=$(tput setaf 61)
        magenta=$(tput setaf 9)
        white=$(tput setaf 8)
        yellow=$(tput setaf 136)

    else

        bold=""
        reset="\e[0m"

        black="\e[1;30m"
        blue="\e[1;34m"
        cyan="\e[1;36m"
        green="\e[1;32m"
        orange="\e[1;33m"
        purple="\e[1;35m"
        red="\e[1;31m"
        magenta="\e[1;31m"
        violet="\e[1;35m"
        white="\e[1;37m"
        yellow="\e[1;33m"

    fi

    # Only show username/host if not default
    function usernamehost() {

        # Highlight the user name when logged in as root.
        if [[ "${USER}" == *"root" ]]; then
            userStyle="${red}";
        else
            userStyle="${magenta}";
        fi;

        userhost=""
        userhost+="${yellow}$HOSTNAME"
        userhost+="${white}:"
        userhost+="\[${userStyle}\]$USER "
        userhost+="${white}in"

        if [ $USER != "$default_username" ]; then echo $userhost ""; fi
    }


    function prompt_git() {
        # this is >5x faster than mathias's.

        # check if we're in a git repo. (fast)
        git rev-parse --is-inside-work-tree &>/dev/null || return

        # check for what branch we're on. (fast)
        #   if… HEAD isn’t a symbolic ref (typical branch),
        #   then… get a tracking remote branch or tag
        #   otherwise… get the short SHA for the latest commit
        #   lastly just give up.
        branchName="$(git symbolic-ref --quiet --short HEAD 2> /dev/null || \
            git describe --all --exact-match HEAD 2> /dev/null || \
            git rev-parse --short HEAD 2> /dev/null || \
            echo '(unknown)')";


        ## early exit for Chromium & Blink repo, as the dirty check takes ~5s
        ## also recommended (via goo.gl/wAVZLa ) : sudo sysctl kern.maxvnodes=$((512*1024))
        repoUrl=$(git config --get remote.origin.url)
        if grep -q chromium.googlesource.com <<<$repoUrl; then
            dirty=" ⁂"
        else

            # check if it's dirty (slow)
            #   technique via github.com/git/git/blob/355d4e173/contrib/completion/git-prompt.sh#L472-L475
            dirty=$(git diff --no-ext-diff --quiet --ignore-submodules --exit-code || echo -e "*")

            # mathias has a few more checks some may like:
            #    github.com/mathiasbynens/dotfiles/blob/a8bd0d4300/.bash_prompt#L30-L43
        fi


        [ -n "${s}" ] && s=" [${s}]";
        echo -e "${1}${branchName}${2}$dirty";

        return
    }



    # ------------------------------------------------------------------
    # | Prompt string                                                  |
    # ------------------------------------------------------------------

    PS1="\[\033]0;\w\007\]"                                 # terminal title (set to the current working directory)
    PS1+="\n\[$bold\]"
    PS1+="\[$(usernamehost)\]"                              # username at host
    PS1+="\[$blue\]\w"                                     # working directory
    PS1+="\$(prompt_git \"$white on $green\" \"$purple\")"   # git repository details
    PS1+="\n"
    PS1+="\[$reset$red\]· \[$reset\]"

    export PS1

    # ------------------------------------------------------------------
    # | Subshell prompt string                                         |
    # ------------------------------------------------------------------

    export PS2="\[$purple\]→ \[$reset\]"

    # ------------------------------------------------------------------
    # | Debug prompt string  (when using `set -x`)                     |
    # ------------------------------------------------------------------

    # When debugging a shell script via `set -x` this tricked-out prompt is used.

    # The first character (+) is used and repeated for stack depth
    # Then, we log the current time, filename and line number, followed by function name, followed by actual source line

    # FWIW, I have spent hours attempting to get time-per-command in here, but it's not possible. ~paul
    export PS4='+ \011\e[1;30m\t\011\e[1;34m${BASH_SOURCE}\e[0m:\e[1;36m${LINENO}\e[0m \011 ${FUNCNAME[0]:+\e[0;35m${FUNCNAME[0]}\e[1;30m()\e[0m:\011\011 }'


    # shoutouts:
    #   https://github.com/dholm/dotshell/blob/master/.local/lib/sh/profile.sh is quite nice.
    #   zprof is also hot.

}



set_prompts
unset set_prompts
