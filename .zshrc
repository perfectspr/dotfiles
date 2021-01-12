# Envs
export ZSH_DISABLE_COMPFIX=true
export ZSH_TMUX_AUTOSTART=true
export FZF_DEFAULT_COMMAND="fdfind --type f -E .git -H"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export EDITOR=vim
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export PATH=$HOME/.local/bin:$PATH

ZSH_THEME="robbyrussell"

export ZSH="$HOME/.oh-my-zsh"
plugins=(
    git
    pyenv
    nvm
    tmux
    fzf
    shrink-path
    autojump
  )

alias rg="rg --hidden --glob '!.git'"
alias venv="python -m venv .venv"
alias act=". .venv/bin/activate"
alias deact="deactivate"

alias t="task"
alias fd="fdfind"

source $ZSH/oh-my-zsh.sh
PS1='$(shrink_path -t)$ '
