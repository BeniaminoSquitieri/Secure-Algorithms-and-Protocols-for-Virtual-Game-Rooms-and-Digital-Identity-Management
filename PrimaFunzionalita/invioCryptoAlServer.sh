cat Player1publickey.pem > requestToPartecipatePlayer1.txt
echo 200BingoCoin >> requestToPartecipatePlayer1.txt
#openssl dgst -verify Player1publickey.pem -signature signatureOfRequestPlayer1.bin requestToPartecipate.txt
openssl dgst -sign Player1privatekey.pem -out signatureOfRequestPlayer1.bin requestToPartecipatePlayer1.txt
echo >> signatureOfRequestPlayer1.bin
bash daClientAServer.sh requestToPartecipate1temp.txt requestToPartecipatePlayer1.txt
perl -0777 -pe 's/\r\n/\n/g' requestToPartecipate1temp.txt > requestToPartecipatePlayer1OnServer.txt
bash daClientAServer.sh signatureOfRequest1temp.bin signatureOfRequestPlayer1.bin
perl -0777 -pe 's/\r\n/\n/g' signatureOfRequest1temp.bin > signatureOfRequestPlayer1OnServer.bin
perl -pi -e 'chomp if eof' signatureOfRequestPlayer1OnServer.bin

cat Player2publickey.pem > requestToPartecipatePlayer2.txt
echo 200BingoCoin >> requestToPartecipatePlayer2.txt
#openssl dgst -verify Player1publickey.pem -signature signatureOfRequestPlayer1.bin requestToPartecipate.txt
openssl dgst -sign Player2privatekey.pem -out signatureOfRequestPlayer2.bin requestToPartecipatePlayer2.txt
echo >> signatureOfRequestPlayer2.bin
bash daClientAServer.sh requestToPartecipate2temp.txt requestToPartecipatePlayer2.txt
perl -0777 -pe 's/\r\n/\n/g' requestToPartecipate2temp.txt > requestToPartecipatePlayer2OnServer.txt
bash daClientAServer.sh signatureOfRequest2temp.bin signatureOfRequestPlayer2.bin
perl -0777 -pe 's/\r\n/\n/g' signatureOfRequest2temp.bin > signatureOfRequestPlayer2OnServer.bin
perl -pi -e 'chomp if eof' signatureOfRequestPlayer2OnServer.bin

cat Player3publickey.pem > requestToPartecipatePlayer3.txt
echo 200BingoCoin >> requestToPartecipatePlayer3.txt
#openssl dgst -verify Player1publickey.pem -signature signatureOfRequestPlayer1.bin requestToPartecipate.txt
openssl dgst -sign Player3privatekey.pem -out signatureOfRequestPlayer3.bin requestToPartecipatePlayer3.txt
echo >> signatureOfRequestPlayer3.bin
bash daClientAServer.sh requestToPartecipate3temp.txt requestToPartecipatePlayer3.txt
perl -0777 -pe 's/\r\n/\n/g' requestToPartecipate3temp.txt > requestToPartecipatePlayer3OnServer.txt
bash daClientAServer.sh signatureOfRequest3temp.bin signatureOfRequestPlayer3.bin
perl -0777 -pe 's/\r\n/\n/g' signatureOfRequest3temp.bin > signatureOfRequestPlayer3OnServer.bin
perl -pi -e 'chomp if eof' signatureOfRequestPlayer3OnServer.bin

cat Player4publickey.pem > requestToPartecipatePlayer4.txt
echo 200BingoCoin >> requestToPartecipatePlayer4.txt
#openssl dgst -verify Player1publickey.pem -signature signatureOfRequestPlayer1.bin requestToPartecipate.txt
openssl dgst -sign Player4privatekey.pem -out signatureOfRequestPlayer4.bin requestToPartecipatePlayer4.txt
echo >> signatureOfRequestPlayer4.bin
bash daClientAServer.sh requestToPartecipate4temp.txt requestToPartecipatePlayer4.txt
perl -0777 -pe 's/\r\n/\n/g' requestToPartecipate4temp.txt > requestToPartecipatePlayer4OnServer.txt
bash daClientAServer.sh signatureOfRequest4temp.bin signatureOfRequestPlayer4.bin
perl -0777 -pe 's/\r\n/\n/g' signatureOfRequest4temp.bin > signatureOfRequestPlayer4OnServer.bin
perl -pi -e 'chomp if eof' signatureOfRequestPlayer4OnServer.bin
