output=$(openssl dgst -verify Player1publickey.pem -signature signatureCommitment1OnServer.bin CommitmentPlayer1OnServer.bin)
echo $output
if [ "$output" != "Verified OK" ]; then
    echo "La firma del Player1 non è valida"
    exit 1
fi

output=$(openssl dgst -verify Player2publickey.pem -signature signatureCommitment2OnServer.bin CommitmentPlayer2OnServer.bin)
if [ "$output" != "Verified OK" ]; then
    echo "La firma del Player2 non è valida"
    exit 1
fi

output=$(openssl dgst -verify Player3publickey.pem -signature signatureCommitment3OnServer.bin CommitmentPlayer3OnServer.bin)
if [ "$output" != "Verified OK" ]; then
    echo "La firma del Player3 non è valida"
    exit 1
fi

output=$(openssl dgst -verify Player4publickey.pem -signature signatureCommitment4OnServer.bin CommitmentPlayer4OnServer.bin)
if [ "$output" != "Verified OK" ]; then
    echo "La firma del Player4 non è valida"
    exit 1
fi

echo "Le firme sono valide"
