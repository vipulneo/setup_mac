# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Zsh Configuration
# Load Powerlevel10k theme
source $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# History setup
HISTFILE=$HOME/.zhistory
SAVEHIST=5000
HISTSIZE=5000
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

# Completion using arrow keys (based on history)
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# Load zsh-autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Load zsh-syntax-highlighting (must be last)
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ---- Eza (better ls) -----
alias ls="eza --icons=always"
alias ll="eza --icons=always -la"
alias lt="eza --icons=always --tree"

# ---- Zoxide (better cd) ----
eval "$(zoxide init zsh)"
alias cd="z"

# User configuration
export LANG=en_US.UTF-8
export EDITOR='vim'

# Add Visual Studio Code (code)
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# Add Homebrew to PATH for Apple Silicon Macs
if [[ $(uname -m) == 'arm64' ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# General aliases
alias zshconfig="$EDITOR ~/.zshrc"
alias ..="cd .."
alias ...="cd ../.."
alias brewup="brew update && brew upgrade && brew cleanup"
alias ip="curl -s https://api.ipify.org"

# Git aliases
alias gs="git status"
alias ga="git add"
alias gc="git commit -m"
alias gp="git push"
alias gl="git pull"

# Functions
mkcd() {
  mkdir -p "$1" && cd "$1"
}
