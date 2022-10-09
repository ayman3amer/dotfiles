#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


## don't duplicate lines in history file
HISTCONTROL=ignoreboth
## append to the history file, don't overwrite it
shopt -s histappend


## for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000

## check the window size after each command and update values for columns
shopt -s checkwinsize

# color prompt enable/disable
color_prompt=yes

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Alias definitions file
if [ -f ~/.config/shell/aliases ]; then
    . ~/.config/shell/aliases
fi

# Alias definitions file
if [ -f ~/.config/shell/functions ]; then
    . ~/.config/shell/functions
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

export PATH=$PATH:/home/ayman/.local/bin
export EDITOR=vim
export LANG=en_US.UTF-8

# vi mode
set -o vi

# set PS1 prompt and make it pretty
if [ "$color_prompt" = yes ]; then
    PS1='\
\[\033[01;33m\]\u\
\[\033[01;31m\]  \
\[\033[01;34m\]\h\
\[\033[01;00m\]:\
\[\033[01;33m\]\w\
\[\033[00m\]\$ '
else
    PS1='[\u@\h \W]\$ '
fi

#PS1='[\u@\h \W]\$ '
