#!/bin/bash

# build screenlist
SLIST=""
SLAST="eDP-1"

for i in $(xrandr -q |grep -o "^.* connected"  |awk '{print $1}'| sort); do
  if [ "$i" == "eDP-1" ]; then
    SLIST=" --output $i --primary --auto $SLIST "
  else
    SLIST="$SLIST --output $i --right-of $SLAST --auto "
    SLAST="$i"
  fi
done

for i in $(xrandr -q |grep -o "^.* disconnected"  |awk '{print $1}'| sort); do
  SLIST="$SLIST --output $i --off"
done

# echo "/usr/bin/xrandr  $SLIST 2>/dev/null"
/usr/bin/xrandr  $SLIST 2>/dev/null

