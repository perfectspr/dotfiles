export ZSH_DISABLE_COMPFIX=true
export ZSH_TMUX_AUTOSTART=true
export FZF_DEFAULT_COMMAND="fd --type f -E .git -H"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export EDITOR=vim
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export PATH=$HOME/.local/bin:$PATH

ZSH_THEME="robbyrussell"

export NODE_OPTIONS='--max-old-space-size=4096'

export ZSH="$HOME/.oh-my-zsh"
plugins=(
    git
    tmux
    fzf
    shrink-path
    autojump
    zsh-autosuggestions
    uv
    direnv
  )

alias rg="rg --hidden --glob '!.git'"
source $ZSH/oh-my-zsh.sh

PS1='$(shrink_path -t)$ '
