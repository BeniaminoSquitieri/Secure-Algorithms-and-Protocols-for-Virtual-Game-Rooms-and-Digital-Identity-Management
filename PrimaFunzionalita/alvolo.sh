#!/bin/bash

# Trova la posizione iniziale dei dati da estrarre
start=$(grep -aob "Verify return code: 19 (self signed certificate in certificate chain)" "$1" | cut -d ':' -f 1)

# Trova la posizione finale dei dati da estrarre
end=$(grep -aob "Post-Handshake New Session Ticket arrived:" "$1" | cut -d ':' -f 1)

# Estrai i dati binari utilizzando dd
dd if="$1" bs=1 skip="$start" count=$((end - start)) status=none > "$2"
