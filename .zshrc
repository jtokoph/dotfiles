# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Dotfiles
export DOTFILES=$HOME/dotfiles

# Zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# Setup homebrew path
if [[ -f "/opt/homebrew/bin/brew" ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Add powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Add zinit plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Snippets
zinit snippet OMZP::asdf

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Keybindings
bindkey '^r' history-incremental-search-backward
bindkey '^n' history-incremental-search-forward

# History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Aliases
alias dotfiles="cd ${DOTFILES}"
alias ls='ls --color'
alias ll='ls -la'
# Always use ssh agent
alias ssh="ssh -A"
alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"
alias reload="source ~/.zshrc"

# Path
# dotfiles bin path
export PATH=$PATH:"${HOME}/dotfiles/bin"

# go bin path
export PATH=$HOME/go/bin:$PATH

# brew sbin
export PATH=/usr/local/sbin:$PATH

# Shell integrations
if command -v fzf &> /dev/null; then
  eval "$(fzf --zsh)"
fi

if command -v zoxide &> /dev/null; then
  eval "$(zoxide init --cmd cd zsh)"
fi

# Added by Docker Desktop to add docker bin to path
source /Users/jtokoph/.docker/init-zsh.sh || true

# Erlang/Elixir - Enable shell history persistence in IEX
export ERL_AFLAGS="-kernel shell_history enabled"

# Smart extract
source "${DOTFILES}/zsh/smart_extract.zsh"


# Load completions near the end so everything else is loaded
autoload -Uz compinit && compinit
# Use cache for completions
zinit cdreplay -q
