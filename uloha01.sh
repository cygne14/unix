#!/bin/bash

if [ "$1" == "--help" ]; then
  echo "Pouziti: uloha01.sh [--typ|--help] [cetsa_k_souboru]"

elif [ "$1" == "--typ" ]; then
  if [ ! -e "$2" ]; then 
    echo Chyba
    exit 1
  elif [ -d "$2" ]; then
    echo adresar
  elif [ -b "$2" ]; then 
    echo "blokove zarizeni"
  elif [ -c "$2" ]; then
    echo "znakove zarizeni"
  elif [ -p "$2" ]; then
    echo "fifo"
  elif [ -h "$2" ]; then
    echo "symbolicky link"
  elif [ -S "$2" ]; then
    echo soket
  elif [ -f "$2" ]; then
    echo soubor
  fi

else echo Chyba

fi

