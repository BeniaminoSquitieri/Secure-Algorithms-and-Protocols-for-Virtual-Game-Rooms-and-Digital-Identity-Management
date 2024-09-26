echo >> ContributoPlayer1.bin
echo >> RandomnessPlayer1.bin
bash daClientAServer.sh ContributoPlayer1temp.bin ContributoPlayer1.bin
perl -0777 -pe 's/\r\n/\n/g' ContributoPlayer1temp.bin > ContributoPlayer1OnServer.bin
perl -pi -e 'chomp if eof' ContributoPlayer1OnServer.bin
bash daClientAServer.sh RandomnessPlayer1temp.bin RandomnessPlayer1.bin
perl -0777 -pe 's/\r\n/\n/g' RandomnessPlayer1temp.bin > RandomnessPlayer1OnServer.bin
perl -pi -e 'chomp if eof' RandomnessPlayer1OnServer.bin

echo >> ContributoPlayer2.bin
echo >> RandomnessPlayer2.bin
bash daClientAServer.sh ContributoPlayer2temp.bin ContributoPlayer2.bin
perl -0777 -pe 's/\r\n/\n/g' ContributoPlayer2temp.bin > ContributoPlayer2OnServer.bin
perl -pi -e 'chomp if eof' ContributoPlayer2OnServer.bin
bash daClientAServer.sh RandomnessPlayer2temp.bin RandomnessPlayer2.bin
perl -0777 -pe 's/\r\n/\n/g' RandomnessPlayer2temp.bin > RandomnessPlayer2OnServer.bin
perl -pi -e 'chomp if eof' RandomnessPlayer2OnServer.bin

echo >> ContributoPlayer3.bin
echo >> RandomnessPlayer3.bin
bash daClientAServer.sh ContributoPlayer3temp.bin ContributoPlayer3.bin
perl -0777 -pe 's/\r\n/\n/g' ContributoPlayer3temp.bin > ContributoPlayer3OnServer.bin
perl -pi -e 'chomp if eof' ContributoPlayer3OnServer.bin
bash daClientAServer.sh RandomnessPlayer3temp.bin RandomnessPlayer3.bin
perl -0777 -pe 's/\r\n/\n/g' RandomnessPlayer3temp.bin > RandomnessPlayer3OnServer.bin
perl -pi -e 'chomp if eof' RandomnessPlayer3OnServer.bin

echo >> ContributoPlayer4.bin
echo >> RandomnessPlayer4.bin
bash daClientAServer.sh ContributoPlayer4temp.bin ContributoPlayer4.bin
perl -0777 -pe 's/\r\n/\n/g' ContributoPlayer4temp.bin > ContributoPlayer4OnServer.bin
perl -pi -e 'chomp if eof' ContributoPlayer4OnServer.bin
bash daClientAServer.sh RandomnessPlayer4temp.bin RandomnessPlayer4.bin
perl -0777 -pe 's/\r\n/\n/g' RandomnessPlayer4temp.bin > RandomnessPlayer4OnServer.bin
perl -pi -e 'chomp if eof' RandomnessPlayer4OnServer.bin
