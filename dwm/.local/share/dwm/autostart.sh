
##########################
# Executed every restart #
##########################

~/.local/bin/fehbg &
xrdb ~/.Xresources
killall dwmblocks
dwmblocks &


################################
# Executed one time at startup #
################################

# start picom if not already running; detect dwm restart based on exit code
picom -b

if [ $? -ne 0 ]; then
    exit 0
fi

# ------------
#  tray icons
# -----------


# --------------------
#  background daemons
# --------------------

# notifications server
dunst -c ~/.config/dunst/dunstrc &

# power manager
mate-power-manager &

# shortcut manager
sxhkd -c ~/.config/sxhkd/dwm_sxhkdrc &

# color temperature 
redshift &

# locker
/home/ayman/.local/bin/locker &

# -----------------
#  startup actions
# -----------------