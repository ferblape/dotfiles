# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# # uncomment for a colored prompt, if the terminal has the capability; turned
# # off by default to not distract the user: the focus in a terminal window
# # should be on the output of commands, not on the prompt
# #force_color_prompt=yes
# 
# if [ -n "$force_color_prompt" ]; then
#     if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
# 	# We have color support; assume it's compliant with Ecma-48
# 	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
# 	# a case would tend to support setf rather than setaf.)
# 	color_prompt=yes
#     else
# 	color_prompt=
#     fi
# fi
# 
# if [ "$color_prompt" = yes ]; then
#     PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
# else
#     PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
# fi
# unset color_prompt force_color_prompt
# 
# # If this is an xterm set the title to user@host:dir
# case "$TERM" in
# xterm*|rxvt*)
#     PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
#     ;;
# *)
#     ;;
# esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

#####################
# Self 
####################
ulimit -S -n 4096

export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
export PATH="/usr/local/bin:/opt/local/bin/:/usr/local/sbin:/usr/local/mysql/bin:/usr/local/pgsql/bin:$PATH"
export PATH=$HOME/bin:$PATH
export PATH=$HOME/.bin:$PATH
export PATH=$HOME/.rbenv/bin:$PATH
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export EDITOR=/usr/bin/vim
export LC_CTYPE=en_US.UTF-8
export DEV=$HOME/proyectos
export DEV_DIR=$HOME/proyectos
export PG_USERNAME=postgres
export PG_HOST=localhost
export PG_PASSWORD=

# Load private environment variables
if [ -f ~/.env ]; then
  source ~/.env
fi

# Utilities
alias v="vim"
alias todob='v /Users/fernando/Dropbox/Documentos/trabajo/todo-big.md'
alias todos='v /Users/fernando/Dropbox/Documentos/trabajo/todo-small.md'
alias gftrade='v /Users/fernando/Dropbox/Documentos/trabajo/gftrade.md'
alias opendch='v /Users/fernando/Dropbox/Documentos/trabajo/opendch.md'
alias ll='ls -lha'
alias lssh='less ~/.ssh/config'

# Development
alias tld='tail -f log/development.log'
alias tpl='tail -f ~/Library/Logs/puma-dev.log'
alias tlt='tail -f log/test.log'
alias server='php -S localhost:8000'
alias t='touch tmp/restart.txt'
alias rc='bin/rails c'
alias rt='bin/rails test'
alias cop='rubocop `git diff --diff-filter=d --name-only master..HEAD`'
alias i18n='i18n-tasks normalize && i18n-tasks health && bin/rails i18n:js:export'
alias paloalto='rm -rf $HOME/Library/Application\ Support/PaloAltoNetworks/'
alias bjs='bundle exec jekyll s --future --incremental --livereload'

# Tmux
alias tls='tmux list-sessions'
alias ta='tmux a -t'

# Help
alias h_pg_restore='echo "pg_restore -c --if-exists -x -O -d <db_name> <file_name>"'

# SSH
alias id_personal='ssh-add -D; ssh-add ~/.ssh/id_dsa'

# Git
alias p='git pull --rebase'
alias P='git push'

# Capistrano
alias D='bundle exec cap production deploy'
alias S='bundle exec cap staging deploy'
# Mina
alias M='mina deploy'

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

source ~/.bin/git-completion.bash

export GIT_PS1_SHOWDIRTYSTATE='true'
# completion support for the github gem
complete -o default -o nospace -F _git gh

# Auto jump
. /usr/share/autojump/autojump.sh

# Prompt
if [ -f "$HOME/.bash-git-prompt/gitprompt.sh" ]; then
  export GIT_PROMPT_ONLY_IN_REPO=1
  export GIT_PROMPT_FETCH_REMOTE_STATUS=0
  #export GIT_PROMPT_THEME=Custom
  export GIT_PROMPT_THEME=Single_line_Solarized 
  source $HOME/.bash-git-prompt/gitprompt.sh
fi

# Rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Nvm
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# Dev environment
export DEV_DIR=~/proyectos
export PG_USERNAME=postgres
export PG_HOST=localhost
export PG_PASSWORD=
