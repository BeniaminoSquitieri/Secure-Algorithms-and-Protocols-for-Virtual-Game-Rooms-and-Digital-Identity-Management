openssl rand -out ContributoPlayer1.bin 32
openssl rand -out ContributoPlayer2.bin 32
openssl rand -out ContributoPlayer3.bin 32
openssl rand -out ContributoPlayer4.bin 32

openssl rand -out ContributoBanco.bin 32

openssl rand -out RandomnessPlayer1.bin 32
openssl rand -out RandomnessPlayer2.bin 32
openssl rand -out RandomnessPlayer3.bin 32
openssl rand -out RandomnessPlayer4.bin 32

openssl rand -out RandomnessBanco.bin 32


cat -b ContributoPlayer1.bin RandomnessPlayer1.bin > concatenatedPlayer1.bin
openssl dgst -sha256 concatenatedPlayer1.bin > CommitmentPlayer1.bin

cat -b ContributoPlayer2.bin RandomnessPlayer2.bin > concatenatedPlayer2.bin
openssl dgst -sha256 concatenatedPlayer2.bin > CommitmentPlayer2.bin

cat -b ContributoPlayer3.bin RandomnessPlayer3.bin > concatenatedPlayer3.bin
openssl dgst -sha256 concatenatedPlayer3.bin > CommitmentPlayer3.bin

cat -b ContributoPlayer4.bin RandomnessPlayer4.bin > concatenatedPlayer4.bin
openssl dgst -sha256 concatenatedPlayer4.bin > CommitmentPlayer4.bin

cat -b ContributoBanco.bin RandomnessBanco.bin > concatenatedBanco.bin
openssl dgst -sha256 concatenatedBanco.bin > CommitmentBanco.bin

rm concatenatedPlayer1.bin concatenatedPlayer2.bin concatenatedPlayer3.bin concatenatedPlayer4.bin concatenatedBanco.bin #CommitmentPlayer1temp.bin CommitmentPlayer2temp.bin CommitmentPlayer3temp.bin CommitmentPlayer4temp.bin CommitmentBancotemp.bin

openssl dgst -sign Player1privatekey.pem -out signatureCommitment1.bin CommitmentPlayer1.bin
openssl dgst -sign Player2privatekey.pem -out signatureCommitment2.bin CommitmentPlayer2.bin
openssl dgst -sign Player3privatekey.pem -out signatureCommitment3.bin CommitmentPlayer3.bin
openssl dgst -sign Player4privatekey.pem -out signatureCommitment4.bin CommitmentPlayer4.bin

openssl dgst -sign Bancoprivatekey.pem -out signatureCommitmentBanco.bin CommitmentBanco.bin


echo >> signatureCommitment1.bin
echo >> signatureCommitment2.bin
echo >> signatureCommitment3.bin
echo >> signatureCommitment4.bin

echo >> signatureCommitmentBanco.bin
