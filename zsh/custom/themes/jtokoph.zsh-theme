NEWLINE=$'\n'

if [ -e ~/.rvm/bin/rvm-prompt ]; then
  CURRENT_RUBY_="%{$fg[white]%}using %{$fg[magenta]%}\$(~/.rvm/bin/rvm-prompt i v | sed s/ruby-//)%{$fg[white]%}%{$reset_color%}"
fi

function project {
  echo $PWD | grep /Users/jtokoph/Sites/ > /dev/null
  if [ $? -eq 0 ]; then
    PROJECT_NAME="$(echo $PWD | sed 's:/Users/jtokoph/Sites/\(blockspring/\)\{0,1\}::' | sed 's:/.*::')"
    MATCHED_FULL_PATH="$(echo $PWD | sed -n /${PROJECT_NAME}$/p)"
    if [ ! "$PWD" = "$MATCHED_FULL_PATH" ]; then
      echo " in %{$fg[red]%}$PROJECT_NAME%{$reset_color%}"
    fi
  fi
}

local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
PROMPT="${NEWLINE}${ret_status} %{$fg[blue]%}%c%{$reset_color%}\$(project) $CURRENT_RUBY_ \$(git_prompt_info)${NEWLINE}%{$fg[red]%}·%{$reset_color%} "

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[white]%}on %{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$reset_color%}"
