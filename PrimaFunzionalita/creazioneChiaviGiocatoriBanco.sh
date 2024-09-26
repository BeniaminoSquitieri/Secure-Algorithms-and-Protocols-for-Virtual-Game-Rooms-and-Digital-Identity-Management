
#openssl ecparam -name prime256v1 -out prime256v1.pem

openssl genpkey -paramfile prime256v1.pem -out Player1privatekey.pem
openssl genpkey -paramfile prime256v1.pem -out Player2privatekey.pem
openssl genpkey -paramfile prime256v1.pem -out Player3privatekey.pem
openssl genpkey -paramfile prime256v1.pem -out Player4privatekey.pem

openssl genpkey -paramfile prime256v1.pem -out Bancoprivatekey.pem

openssl pkey -in Player1privatekey.pem -pubout -out Player1publickey.pem
openssl pkey -in Player2privatekey.pem -pubout -out Player2publickey.pem
openssl pkey -in Player3privatekey.pem -pubout -out Player3publickey.pem
openssl pkey -in Player4privatekey.pem -pubout -out Player4publickey.pem

openssl pkey -in Bancoprivatekey.pem -pubout -out Bancopublickey.pem

