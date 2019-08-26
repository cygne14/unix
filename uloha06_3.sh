#!/bin/bash

#nazev skupiny ma splnovat [_a-z][-0-9_a-z]*\$?
skupiny="$( cat $1 | sed 's/\([_a-z][-0-9_a-z]*\$?\):x:[0-9]\+:[a-zA-Z]\+,/\1,/' | awk 'BEGIN { FS="," } { print(NF,$1) }' )"

#setridi podle poctu lidi ve skupine, od nejvetsiho cisla
skupiny="$( echo "$skupiny" | sort -gr)"

prvni=$( echo "$skupiny" | head -n 1 | awk '{ print($1) }')

#pokud se prvni sloupec rovna nejvetsimu cislu tak vypisu jmeno skupiny
echo "$skupiny" | awk -v p=$prvni '{ if ($1==p) { print($2) } }'
