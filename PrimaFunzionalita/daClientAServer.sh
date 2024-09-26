#!/bin/bash
# Avvio del server s_server in background
openssl s_server -port 8444 -key wwwkey.pem -cert wwwcert.pem -CAfile cacert.pem -ciphersuites TLS_AES_256_GCM_SHA384 2>&1 | tee temp.bin &

cat "$2" | openssl s_client -connect localhost:8444 -crlf -ciphersuites TLS_AES_256_GCM_SHA384

echo $1
s_server_pid=$!
((s_server_pid = s_server_pid -1 ))
timeout 0.1 sleep 0.1

sed -n '/Secure Renegotiation IS supported/,/DONE/p' temp.bin | sed '1d;$d' > "$1"
kill $s_server_pid
rm temp.bin
