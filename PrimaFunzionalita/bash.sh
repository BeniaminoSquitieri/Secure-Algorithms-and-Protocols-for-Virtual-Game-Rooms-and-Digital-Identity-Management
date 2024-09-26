#!/bin/bash
# Avvio del server s_server in background
openssl s_server -port 8444 -key wwwkey.pem -cert wwwcert.pem -CAfile cacert.pem 2>&1 | tee quellochevoglio.txt &

cat "$2" | openssl s_client -connect localhost:8444 -crlf

echo $1
s_server_pid=$!
((s_server_pid = s_server_pid -1 ))
timeout 5 sleep 5

tail -n 2 quellochevoglio.txt | head -n 1 > "$1" 
grep -e "DONE" quellochevoglio.txt | tail -n 2 | sed -n '1h;1!H;${;g;s/.*DONE\(.*\)DONE.*/\1/;p;}' > quellochevorrei.bin

kill $s_server_pid

