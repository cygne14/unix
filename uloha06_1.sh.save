#!/bin/bash

#jako oddelovac treba poli @, aby to nebyla mezera
jmena="$( join -t "@" <(sort $1) <(sort $2) )"
jmena="$( join -t "@" <(sort $3) <(echo "$jmena") )"
echo "$jmena"
