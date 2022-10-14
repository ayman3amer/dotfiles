#!/bin/sh
export ZDOTDIR=$HOME/.config/zsh
# HISTFILE=~/.zsh_history
setopt appendhistory

# some useful options (man zshoptions)
setopt autocd extendedglob nomatch menucomplete
setopt interactive_comments
stty stop undef		# Disable ctrl-s to freeze terminal.
zle_highlight=('paste:none')

# beeping is annoying
unsetopt BEEP

# completions
autoload -Uz compinit
zstyle ':completion:*' menu select
# zstyle ':completion::complete:lsof:*' menu yes select
zmodload zsh/complist
# compinit
_comp_options+=(globdots)		# Include hidden files.
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
compinit

# Enable colors and change prompt:
autoload -U colors && colors	# Load colors

# path
typeset -U PATH path
path=("$HOME/.local/bin" "$path[@]")
export PATH

# Useful Functions
source "$ZDOTDIR/zsh-functions"

# Normal files to source
zsh_add_file "zsh-aliases"
zsh_add_file "zsh-prompt"

# Plugins
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_plugin "hlissner/zsh-autopair"
zsh_add_completion "esc/conda-zsh-completion" false

# Key-bindings
bindkey -v

# History
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=100000

# Environmental variables:
export EDITOR="vim"
export TERMINAL="alacritty"
export BROWSER="brave"
export launcher="dmenu_run"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export QT_QPA_PLATFORMTHEME="qt5ct"	
export AWT_TOOLKIT="MToolkit wmname LG3D"
export _JAVA_AWT_WM_NONREPARENTING=1


if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then 
  exec startx &>/dev/null 
fi