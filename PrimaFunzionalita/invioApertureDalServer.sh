cat ContributoPlayer1OnServer.bin ContributoPlayer2OnServer.bin ContributoPlayer3OnServer.bin ContributoPlayer4OnServer.bin ContributoBanco.bin | openssl dgst -sha256 > StringaRandomCalcolataDalServer.bin

echo >> ContributoPlayer1OnServer.bin
echo >> RandomnessPlayer1OnServer.bin
bash daServerAClient.sh ContributoPlayer1OnServer.bin ContributoPlayer1DaServer.bin
perl -pi -e 'chomp if eof' ContributoPlayer1DaServer.bin
bash daServerAClient.sh RandomnessPlayer1OnServer.bin RandomnessPlayer1DaServer.bin
perl -pi -e 'chomp if eof' RandomnessPlayer1DaServer.bin

echo >> ContributoPlayer2OnServer.bin
echo >> RandomnessPlayer2OnServer.bin
bash daServerAClient.sh ContributoPlayer2OnServer.bin ContributoPlayer2DaServer.bin
perl -pi -e 'chomp if eof' ContributoPlayer2DaServer.bin
bash daServerAClient.sh RandomnessPlayer2OnServer.bin RandomnessPlayer2DaServer.bin
perl -pi -e 'chomp if eof' RandomnessPlayer2DaServer.bin

echo >> ContributoPlayer3OnServer.bin
echo >> RandomnessPlayer3OnServer.bin
bash daServerAClient.sh ContributoPlayer3OnServer.bin ContributoPlayer3DaServer.bin
perl -pi -e 'chomp if eof' ContributoPlayer3DaServer.bin
bash daServerAClient.sh RandomnessPlayer3OnServer.bin RandomnessPlayer3DaServer.bin
perl -pi -e 'chomp if eof' RandomnessPlayer3DaServer.bin

echo >> ContributoPlayer4OnServer.bin
echo >> RandomnessPlayer4OnServer.bin
bash daServerAClient.sh ContributoPlayer4OnServer.bin ContributoPlayer4DaServer.bin
perl -pi -e 'chomp if eof' ContributoPlayer4DaServer.bin
bash daServerAClient.sh RandomnessPlayer4OnServer.bin RandomnessPlayer4DaServer.bin
perl -pi -e 'chomp if eof' RandomnessPlayer4DaServer.bin

echo >> ContributoBanco.bin
echo >> RandomnessBanco.bin
bash daServerAClient.sh ContributoBanco.bin ContributoBancoDaServer.bin
perl -pi -e 'chomp if eof' ContributoBancoDaServer.bin
bash daServerAClient.sh RandomnessBanco.bin RandomnessBancoDaServer.bin
perl -pi -e 'chomp if eof' RandomnessBancoDaServer.bin


bash daServerAClient.sh StringaRandomCalcolataDalServer.bin StringaRandomInviataDalServer.bin
