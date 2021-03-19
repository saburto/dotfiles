export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="spaceship"

SPACESHIP_PROMPT_ORDER=(
  time          # Time stampts section
  user          # Username section
  host          # Hostname section
  dir           # Current directory section
  aws
  venv
  pyenv
  node
  git           # Git section (git_branch + git_status)
  exec_time     # Execution time
  line_sep      # Line break
  vi_mode       # Vi-mode indicator
  jobs          # Backgound jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)
export SPACESHIP_VI_MODE_COLOR=black

plugins=(git bgnotify autojump tmux gradle ssh-agent nvm vi-mode kubectl)

ZSH_TMUX_AUTOSTART=true

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8

export EDITOR='vim'
bindkey "^X^E" edit-command-line

if [ -d "$HOME/.local/bin" ]; then
  PATH="$HOME/.local/bin:$PATH"
fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"


source "$HOME/.oh-my-zsh/custom/themes/spaceship.zsh-theme"

stty stop undef
stty start undef
stty -ixon

alias tmux="env TERM=xterm-256color tmux"
alias vimf="vim \$(fzf)"
alias \$=time

# Use maven d instead of mvn
alias mvn=mvnd

# Load direnv
eval "$(direnv hook zsh)"

setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_BEEP



export PATH="$HOME/.cask/bin:$PATH"

[ -d ~/.fzf ] && source ~/.fzf/shell/completion.zsh
[ -d ~/.fzf ] && source ~/.fzf/shell/key-bindings.zsh

export FZF_DEFAULT_COMMAND='ag --nocolor -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
