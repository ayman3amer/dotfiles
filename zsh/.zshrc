export ZDOTDIR=$HOME/.config/zsh
# Enable colors and change prompt:
autoload -U colors && colors	# Load colors

# opt
setopt autocd		# Automatically cd into typed directory.
stty stop undef		# Disable ctrl-s to freeze terminal.

# Useful Functions
source "$ZDOTDIR/zsh-functions"
zsh_add_file "zsh-aliases"
zsh_add_file "zsh-prompt"
# Plugins
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_plugin "hlissner/zsh-autopair"

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

# bindkey
bindkey -v

# compinstall
zstyle :compinstall filename '/home/ayman/.zshrc'
autoload -Uz compinit
compinit

# path
typeset -U PATH path
path=("$HOME/.local/bin" "$path[@]")
export PATH

# aliasies
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliases" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliases"
# functions
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/functions" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/functions"




if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then 
  exec startx &>/dev/null 
fi