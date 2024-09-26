 #!/bin/bash
# Avvio del server s_server in background
cat "$1" | openssl s_server -port 8444 -key wwwkey.pem -cert wwwcert.pem -CAfile cacert.pem -ciphersuites TLS_AES_256_GCM_SHA384 &
openssl s_client -connect localhost:8444 -crlf -ciphersuites TLS_AES_256_GCM_SHA384 > temp.bin


s_server_pid=$!
((s_server_pid = s_server_pid -1 ))
timeout 0.1 sleep 0.1

sed -n '/Verify return code: 19 (self signed certificate in certificate chain)/,/Post-Handshake/p' temp.bin | sed '1d;$d' > temp2.bin
rm temp.bin
tail -n +2 temp2.bin > temp.bin
sed '/---/q' temp.bin | head -n -1 > "$2"
#sed -n '/Verify return code/,/Post-Handshake/{p;/Post-Handshake/q}' temp.bin | tail -n 3 | head -n 1 > "$2"
 
