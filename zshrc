export ZSH=/home/saburto/.oh-my-zsh

ZSH_THEME="spaceship"

SPACESHIP_PROMPT_ORDER=(
  time          # Time stampts section
  user          # Username section
  host          # Hostname section
  dir           # Current directory section
  git           # Git section (git_branch + git_status)
  exec_time     # Execution time
  line_sep      # Line break
  vi_mode       # Vi-mode indicator
  jobs          # Backgound jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)


plugins=(git bgnotify autojump tmux gradle)

ZSH_TMUX_AUTOSTART=true

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8

export EDITOR='vim'

if [ -d "$HOME/.local/bin" ]; then
  PATH="$HOME/.local/bin:$PATH"
fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/saburto/.sdkman"
[[ -s "/home/saburto/.sdkman/bin/sdkman-init.sh" ]] && source "/home/saburto/.sdkman/bin/sdkman-init.sh"


source "/home/saburto/.oh-my-zsh/custom/themes/spaceship.zsh-theme"

stty stop undef
stty start undef
