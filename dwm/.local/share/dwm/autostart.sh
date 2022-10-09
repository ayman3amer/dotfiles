
##########################
# Executed every restart #
##########################

~/.fehbg &
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
# ------------

nm-applet &
volumeicon &
discord --start-minimized &

# --------------------
#  background daemons
# --------------------

# color temperature
# xflux -l '38' -g '-9' -k 4500 &

# notifications
dunst -c ~/.config/dunst/dunstrc &

# power manager
mate-power-manager &

#sxhkd
sxhkd &

# redshift
redshift-gtk &

# locker
/home/ayman/.local/bin/locker &


# -----------------
#  startup actions
# -----------------