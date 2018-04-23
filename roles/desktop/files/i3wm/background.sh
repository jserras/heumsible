#!/bin/sh

sleep 2
while true; do
	find ~/Pictures/backgrounds -type f \( -name '*.jpg' -o -name '*.png' \) -print0 |
		shuf -n1 -z | xargs -0 feh --bg-max
	sleep 5m
done
