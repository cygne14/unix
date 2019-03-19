#!/bin/bash

if [ "$1" == "--normal" ]; then
  for i in "$@"; do
    echo "$i"
  done

elif [ "$1" == "--reverse" ]; then
  for ((i="$#" ; i>0 ; i--)); do
    echo "${!i}"    # vypise obsah argumentu $i
  done

elif [ "$1" == "--subst" ]; then
  for ((i=4 ; i<="$#" ; i++)); do
    echo "${!i//$2/$3}"
  done

elif [ "$1" == "--len" ]; then
  for ((i=1 ; i<="$#" ; i++)); do
    arg="${!i}" 
    echo -n "${#arg} " #vypisu delku promenne $arg
  done
  echo
 
elif [ "$1" == "--help" ]; then
  echo "Pouziti: uloha02.sh [OPTION] [args]"; echo
  echo "--normal"; echo "Ak prvý argument skriptu je --normal, skript vypíše všetky argumenty (vrátane --normal), každý arugment na jeden riadok."
  echo; echo "--reverse"; echo "Ak prvý argument skriptu je --reverse, skript vypíše argumenty v opačnom poradí, ako sú na vstupe, každý na jeden riadok."
  echo; echo "--subst"; echo "Ak pvý argument skriptu je --subst, druhý je nejaký reťazec A a tretí reťazec B, skript v každom argumente vymení všetky výskyty A na B a vypíše ich, každý na jeden riadok."
  echo; echo "--len"; echo "Ak prvý argument skriptu je --len, skript vypíše na jeden riadok dĺžky všetkých argumentov, oddelený medzerami."

fi

exit 0
