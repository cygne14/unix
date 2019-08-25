#!/bin/bash

#en a cz maji sloupce oddeleny ; 
#jmena jsou v en v 1. sloupci a v cz v 4. sloupci
# v en a cz jsou ulozeny setrideny jmena statu v uvozovkach
en=$( cat $1 | awk 'BEGIN { FS=";" } { print($1) }' | sort )
cz=$( cat $2 | awk 'BEGIN { FS=";" } { print($4) }' | sort )

staty="$( join -t "@" <(echo "$en") <(echo "$cz") )"

staty="$( echo "$staty" | sed 's/"\(.*\)"/\1/' )"

echo "$staty"
