#!/bin/bash

### old stuff
#  xrandr --newmode "fhd"  173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync
#  xrandr --newmode "lhd"  106.50  1440 1528 1672 1904  900 903 909 934 -hsync +vsync
#  xrandr --addmode DP1 fhd
#  xrandr --addmode DP2 fhd
#  xrandr --addmode VGA1 lhd
#  xrandr --fb 5280x1080 --output DP2 --mode fhd --pos 1920x0 --output DP1 --mode fhd --pos 0x0 --output VGA1 --primary --pos 3840x180 --mode lhd


xrandrtest=$(xrandr |grep -o "^.* connected"  |awk '{print $1}')
#echo "xrandrtest= $xrandrtest ;"

if [[ "$xrandrtest" == *"DP-2-2"* && "$xrandrtest" == *"DP-2-3"* ]]; then
    echo "dual screen setup"
    xrandr --fb 3840x1080 --output DP-2-2  --pos 0x0 --output DP-2-3 --pos 1920x0 --primary --output eDP-1 --off
    fontsize=7

elif [[ "$xrandrtest" == *"HDMI-1"* ]]; then
    echo "projector"
    xrandr --fb 1920x1080 --output eDP-1 --primary --pos 0x0 --output HDMI-1 --same-as eDP-1
    fontsize=8
    
elif [[ "$xrandrtest" == *"HDMI-2"* ]]; then
    if [[ "$1" == "dual" || "$2" == "dual" ]] ; then
        echo "forced dualscreen";
        xrandr --fb 3840x1200 --output eDP-1  --pos 0x0 --output HDMI-2 --pos 1920x0 --primary --output eDP-1 --auto
    else
        echo "extern"
        xrandr --output HDMI-2 --auto --primary --output eDP-1 --off
        fontsize=7
    fi
else
    echo "single screen setup"
    xrandr --fb 1920x1080 --output eDP-1 --primary --pos 0x0 --auto
    fontsize=7
fi

if [ -n "$1" ] && [ "$1" -eq "$1" ] 2>/dev/null ; then
  fontsize=$1
fi

sed -i "s/^FontName=.*/FontName=Monospace ${fontsize}/" ~/.config/xfce4/terminal/terminalrc
sed -i "s/\"font_size\": .*/\"font_size\": ${fontsize},/" ~/.config/sublime-text-3/Packages/User/Preferences.sublime-settings

