#!/bin/bash
# Correctly processes only pgn files with times after each move and without any extra comments.
# Usage: make-pgns.sh <input.pgn> <output>
# Example: make-pgns.sh clocks2.pgn game-7
# Suffix "-<N>.pgn" will be added to output. No error check is done.

INPUT=$1
OUTPUT=$2

sed -e '/^$/,$d' $INPUT | grep -v '\[Result' > $OUTPUT-head.pgn
moves=($(sed -ne '/^$/,$p' $INPUT | grep -Ev '^$' | tr '\n' ' '))

move=0
i=0
out=()

inc() {
	out=("${out[@]}" ${moves[$i]})
	i=$(($i+1))
}

save() {
	(cat $OUTPUT-head.pgn && echo && echo ${out[@]}) > $OUTPUT-$(printf '%03d' $move).pgn
	move=$(($move+1))
}

while true; do
	inc; inc; inc; inc; save
	inc; inc; inc; save
#	[ $i -ge 10 ] && break
	[ $i -ge ${#moves[@]} ] && break
done

rm $OUTPUT-head.pgn
