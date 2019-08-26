#!/bin/bash

#prvni sloupec je pocet lidi a druhy jmeno skupiny
skupiny="$( cat $1 | awk 'BEGIN { FS=":" } { print($3, $1) }' )"

#setridi podle poctu lidi ve skupine, od nejvetsiho cisla
skupiny="$( echo "$skupiny" | sort -gr)"

prvni=$( echo "$skupiny" | head -n 1 | awk '{ print($1) }')

#pokud se prvni sloupec rovna nejvetsimu cislu tak vypisu jmeno skupiny
echo "$skupiny" | awk -v p=$prvni '{ if ($1==p) { print($2) } }'
