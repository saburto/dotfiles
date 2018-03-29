export ZSH=$HOME/.oh-my-zsh


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

alias tmux="env TERM=xterm-256color tmux"

alias s="sfdx"
alias sfo="sfdx force:org:open --path one/one.app"
alias sfl="sfdx force:org:list --all"
alias sfpush="sfdx force:source:push"
alias sfpull="sfdx force:source:pull"


writecmd () { 
  perl -e 'ioctl STDOUT, 0x5412, $_ for split //, do{ chomp($_ = <>); $_ }' ; 
}

alias sf="cat ~/.sfdxcommands | awk '{print \$1}' | fzf --preview 'sfdx help {}' | awk '{print \"sfdx \" \$1}'|  writecmd"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='ag --nocolor -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"


alias vimf="vim \$(fzf)"
alias \$=time

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
