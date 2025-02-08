if [[ "$OSTYPE" == "linux-gnu"* ]]; then
export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
fi

eval "$(starship init zsh)"

# history setup
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

# completion using arrow keys (based on history)
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward


# ---- Zoxide (better cd) ----
eval "$(zoxide init zsh)"

export PATH=~/bin:$PATH
export PATH=$PATH:$HOME/go/bin

alias vim=nvim

# Obsidian
alias oo='cd $HOME/Documents/Personal'
alias or='vim $HOME/Documents/Personal/1_Inbox/*.md'


# Better ls
alias ls="ls --color"


# Windows WSL config
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  source /home/linuxbrew/.linuxbrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  source /home/linuxbrew/.linuxbrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"

  export JAVA_HOME="/home/linuxbrew/.linuxbrew/opt/openjdk"

# Mac Config
elif [[ "$OSTYPE" == "darwin"* ]]; then
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"
export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"
    # Java
export PATH="/usr/local/opt/openjdk@21/bin:$PATH"
export JAVA_HOME="/Library/Java/JavaVirtualMachines/openjdk.jdk/Contents/Home/"
fi
