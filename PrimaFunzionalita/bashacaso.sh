#!/bin/bash

# Imposta il nome del file
file="BingoChainCommitments.txt"

# Cerca l'occorrenza nel file
riga=$(grep -m 1 "concatenatedPlayer4" "$file")

if [ -n "$riga" ]; then
  echo "OCCORRENZA TROVATA:"
  echo "$riga"
else
  echo "L'occorrenza 'concatenatedPlayer4' non è stata trovata nel file."
fi

