openssl ecparam -name prime256v1 -out prime256v1.pem
openssl genpkey -paramfile prime256v1.pem -out cakey.pem
openssl pkey -in ca_key.pem -pubout -out capub_key.pem
sudo openssl req -new -x509 -days 365 -key cakey.pem -out cacert.pem -config /etc/ssl/openssl.cnf
mkdir demoCA
mkdir demoCA/private
mkdir demoCA/newcerts
touch demoCA/index.txt demoCA/serial
echo "00" >> demoCA/serial
cp cacert.pem demoCA
cp cakey.pem demoCA/private


openssl genpkey -paramfile prime256v1.pem -out wwwkey.pem
openssl pkey -in wwwkey.pem -pubout -out wwwpub_key.pem
openssl req -new -key wwwkey.pem -out wwwrequest.pem -config myconfig.cfg



sudo openssl ca -in wwwrequest.pem -out wwwcert.pem -policy policy_anything -config /etc/ssl/openssl.cnf -extfile extensions.cnf

