bash daServerAClient.sh CommitmentPlayer1OnServer.bin CommitmentPlayer1DaServer.bin
echo >> signatureCommitment1OnServer.bin
bash daServerAClient.sh signatureCommitment1OnServer.bin signatureCommitment1DaServer.bin
perl -pi -e 'chomp if eof' signatureCommitment1DaServer.bin

bash daServerAClient.sh CommitmentPlayer2OnServer.bin CommitmentPlayer2DaServer.bin
echo >> signatureCommitment2OnServer.bin
bash daServerAClient.sh signatureCommitment2OnServer.bin signatureCommitment2DaServer.bin
perl -pi -e 'chomp if eof' signatureCommitment2DaServer.bin

bash daServerAClient.sh CommitmentPlayer3OnServer.bin CommitmentPlayer3DaServer.bin
echo >> signatureCommitment3OnServer.bin
bash daServerAClient.sh signatureCommitment3OnServer.bin signatureCommitment3DaServer.bin
perl -pi -e 'chomp if eof' signatureCommitment3DaServer.bin

bash daServerAClient.sh CommitmentPlayer4OnServer.bin CommitmentPlayer4DaServer.bin
echo >> signatureCommitment4OnServer.bin
bash daServerAClient.sh signatureCommitment4OnServer.bin signatureCommitment4DaServer.bin
perl -pi -e 'chomp if eof' signatureCommitment4DaServer.bin

bash daServerAClient.sh CommitmentBanco.bin CommitmentBancoDaServer.bin
bash daServerAClient.sh signatureCommitmentBanco.bin signatureCommitmentBancoDaServer.bin
perl -pi -e 'chomp if eof' signatureCommitmentBancoDaServer.bin
