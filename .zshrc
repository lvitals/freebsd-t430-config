# Enable colors and change prompt:
autoload -U colors && colors

# Load version control information
autoload -Uz vcs_info
DISABLE_AUTO_TITLE="true"

precmd () {
  vcs_info
  window_title="\033]0;$(pwd -L)\007"
  echo -ne "$window_title"
}

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats '(%b)'

# Set up the prompt (with git branch name)
setopt PROMPT_SUBST

# Enable colored output
export CLICOLOR=YES 
if which dircolors &>/dev/null; then
  alias ls="ls --color=auto"
  alias diff='diff --color=auto'
  alias grep='grep --color=auto'
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# End of lines configured by zsh-newuser-install
# Share history between tmux windows
setopt SHARE_HISTORY
setopt hist_ignore_space
setopt histignoredups

# Support TAB/TAB/TAB for repeated autocompletion
zmodload zsh/complist
bindkey -M menuselect '^I' accept-and-infer-next-history

# fix keys home/end/delete, command: autoload zkbd ; zkbd
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[4~"  end-of-line
bindkey  "^[[P"   delete-char
bindkey  "^?"     backward-delete-char

# prompt
NEWLINE=$'\n'
PROMPT='%{$fg[gray]%}%n%{$fg[gray]%}@%{$fg[gray]%}%m%{$fg[cyan]%} ${PWD/#$HOME/~} %{$fg[green]%}${vcs_info_msg_0_}%{$reset_color%}${NEWLINE}% %#%{$fg[default]%} '

# zsh-completions
plugins=(zsh-completions)
autoload -U compinit && compinit

# Add RVM to PATH for scripting. 
export PATH="$PATH:$HOME/.rvm/bin"
source $HOME/.rvm/scripts/rvm
