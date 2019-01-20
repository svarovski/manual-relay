#!/bin/bash

GAME=$1
DELAY=$2
[ "x$GAME" == "x" ] && echo "Game id required" && exit 1
[ "x$DELAY" == "x" ] && DELAY=10

while true; do
	for I in game-$GAME-???.pgn; do
		touch $I
		ln -sf $I game-$GAME.pgn
		sleep $DELAY
	done
done

