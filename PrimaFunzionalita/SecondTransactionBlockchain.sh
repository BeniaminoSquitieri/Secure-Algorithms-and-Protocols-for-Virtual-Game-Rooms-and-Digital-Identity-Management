echo "BEGIN BLOCK 2" >> BingoChaintemp.txt
echo "BEGIN TRANSACTION 1" >> BingoChaintemp.txt
cat CommitmentPlayer1OnServer.bin >> BingoChaintemp.txt
cat Player1publickey.pem >> BingoChaintemp.txt
cat signatureCommitment1OnServer.bin >> BingoChaintemp.txt
echo >> BingoChaintemp.txt
echo "END TRANSACTION 1" >> BingoChaintemp.txt

output=$(openssl dgst -verify Player1publickey.pem -signature signatureCommitment1OnServer.bin CommitmentPlayer1OnServer.bin)
if [ "$output" == "Verified OK" ]; then
    output=0
else
    echo "La firma del Player 1 non è valida"
    rm BingoChaintemp.txt
    exit 1
fi

if grep -q -f Player1publickey.pem BingoChain.txt; then
    output=0;
else
    echo "Il Player 1 non è stato inserito tra i partecipanti della partita"
    rm BingoChaintemp.txt
    exit 1
fi

echo "BEGIN TRANSACTION 2" >> BingoChaintemp.txt
cat CommitmentPlayer2OnServer.bin >> BingoChaintemp.txt
cat Player2publickey.pem >> BingoChaintemp.txt
cat signatureCommitment2OnServer.bin >> BingoChaintemp.txt

echo >> BingoChaintemp.txt
echo "END TRANSACTION 2" >> BingoChaintemp.txt

output=$(openssl dgst -verify Player2publickey.pem -signature signatureCommitment2OnServer.bin CommitmentPlayer2OnServer.bin)
if [ "$output" == "Verified OK" ]; then
    output=0
else
    echo "La firma del Player 2 non è valida"
    rm BingoChaintemp.txt
    exit 1
fi

if grep -q -f Player2publickey.pem BingoChain.txt; then
    output=0;
else
    echo "Il Player 2 non è stato inserito tra i partecipanti della partita"
    rm BingoChaintemp.txt
    exit 1
fi

echo "BEGIN TRANSACTION 3" >> BingoChaintemp.txt
cat CommitmentPlayer3OnServer.bin >> BingoChaintemp.txt
cat Player3publickey.pem >> BingoChaintemp.txt
cat signatureCommitment3OnServer.bin >> BingoChaintemp.txt
echo >> BingoChaintemp.txt
echo "END TRANSACTION 3" >> BingoChaintemp.txt

output=$(openssl dgst -verify Player3publickey.pem -signature signatureCommitment3OnServer.bin CommitmentPlayer3OnServer.bin)
if [ "$output" == "Verified OK" ]; then
    output=0
else
    echo "La firma del Player 3 non è valida"
    rm BingoChaintemp.txt
    exit 1
fi

if grep -q -f Player3publickey.pem BingoChain.txt; then
    output=0;
else
    echo "Il Player 3 non è stato inserito tra i partecipanti della partita"
    rm BingoChaintemp.txt
    exit 1
fi

echo "BEGIN TRANSACTION 4" >> BingoChaintemp.txt
cat CommitmentPlayer4OnServer.bin >> BingoChaintemp.txt
cat Player4publickey.pem >> BingoChaintemp.txt
cat signatureCommitment4OnServer.bin >> BingoChaintemp.txt
echo >> BingoChaintemp.txt
echo "END TRANSACTION 4" >> BingoChaintemp.txt

output=$(openssl dgst -verify Player4publickey.pem -signature signatureCommitment4OnServer.bin CommitmentPlayer4OnServer.bin)
if [ "$output" == "Verified OK" ]; then
    output=0
else
    echo "La firma del Player 4 non è valida"
    rm BingoChaintemp.txt
    exit 1
fi

if grep -q -f Player4publickey.pem BingoChain.txt; then
    output=0;
else
    echo "Il Player 4 non è stato inserito tra i partecipanti della partita"
    rm BingoChaintemp.txt
    exit 1
fi


echo "BEGIN TRANSACTION 5" >> BingoChaintemp.txt
cat CommitmentBanco.bin >> BingoChaintemp.txt
cat Bancopublickey.pem >> BingoChaintemp.txt
perl -pi -e 'chomp if eof' signatureCommitmentBanco.bin
cat signatureCommitmentBanco.bin >> BingoChaintemp.txt
echo >> BingoChaintemp.txt
echo "END TRANSACTION 5" >> BingoChaintemp.txt

output=$(openssl dgst -verify Bancopublickey.pem -signature signatureCommitmentBanco.bin CommitmentBanco.bin)
if [ "$output" == "Verified OK" ]; then
    output=0
else
    echo "La firma del Banco non è valida"
    rm BingoChaintemp.txt
    exit 1
fi

if grep -q -f Bancopublickey.pem BingoChain.txt; then
    output=0;
else
    echo "Il Banco non è stato inserito tra i partecipanti della partita"
    rm BingoChaintemp.txt
    exit 1
fi

echo "END BLOCK 2" >> BingoChaintemp.txt
cat BingoChaintemp.txt >> BingoChain.txt
