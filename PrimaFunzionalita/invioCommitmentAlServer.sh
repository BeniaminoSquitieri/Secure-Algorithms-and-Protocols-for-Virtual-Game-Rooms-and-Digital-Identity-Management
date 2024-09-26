bash daClientAServer.sh CommitmentPlayer1temp.bin CommitmentPlayer1.bin
perl -0777 -pe 's/\r\n/\n/g' CommitmentPlayer1temp.bin > CommitmentPlayer1OnServer.bin
bash daClientAServer.sh signatureCommitment1temp.bin signatureCommitment1.bin
perl -0777 -pe 's/\r\n/\n/g' signatureCommitment1temp.bin > signatureCommitment1OnServer.bin
perl -pi -e 'chomp if eof' signatureCommitment1OnServer.bin

bash daClientAServer.sh CommitmentPlayer2temp.bin CommitmentPlayer2.bin
perl -0777 -pe 's/\r\n/\n/g' CommitmentPlayer2temp.bin > CommitmentPlayer2OnServer.bin
bash daClientAServer.sh signatureCommitment2temp.bin signatureCommitment2.bin
perl -0777 -pe 's/\r\n/\n/g' signatureCommitment2temp.bin > signatureCommitment2OnServer.bin
perl -pi -e 'chomp if eof' signatureCommitment2OnServer.bin

bash daClientAServer.sh CommitmentPlayer3temp.bin CommitmentPlayer3.bin
perl -0777 -pe 's/\r\n/\n/g' CommitmentPlayer3temp.bin > CommitmentPlayer3OnServer.bin
bash daClientAServer.sh signatureCommitment3temp.bin signatureCommitment3.bin
perl -0777 -pe 's/\r\n/\n/g' signatureCommitment3temp.bin > signatureCommitment3OnServer.bin
perl -pi -e 'chomp if eof' signatureCommitment3OnServer.bin

bash daClientAServer.sh CommitmentPlayer4temp.bin CommitmentPlayer4.bin
perl -0777 -pe 's/\r\n/\n/g' CommitmentPlayer4temp.bin > CommitmentPlayer4OnServer.bin
bash daClientAServer.sh signatureCommitment4temp.bin signatureCommitment4.bin
perl -0777 -pe 's/\r\n/\n/g' signatureCommitment4temp.bin > signatureCommitment4OnServer.bin
perl -pi -e 'chomp if eof' signatureCommitment4OnServer.bin

rm CommitmentPlayer1temp.bin signatureCommitment1temp.bin CommitmentPlayer2temp.bin signatureCommitment2temp.bin CommitmentPlayer3temp.bin signatureCommitment3temp.bin CommitmentPlayer4temp.bin signatureCommitment4temp.bin

