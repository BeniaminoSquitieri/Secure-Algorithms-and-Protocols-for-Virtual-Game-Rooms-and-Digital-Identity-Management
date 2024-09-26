rm BingoChaintemp.txt
rm BingoChainCommitments.txt
echo "BEGIN BLOCK 3" >> BingoChaintemp.txt
echo "BEGIN TRANSACTION 1" >> BingoChaintemp.txt
cat Player1publickey.pem >> BingoChaintemp.txt

cat -b ContributoPlayer1OnServer.bin RandomnessPlayer1OnServer.bin > concatenatedPlayer1.bin
openssl dgst -sha256 concatenatedPlayer1.bin > OpenedCommitmentPlayer1OnChain.bin

echo >> ContributoPlayer1OnServer.bin
echo >> RandomnessPlayer1OnServer.bin
cat ContributoPlayer1OnServer.bin >> BingoChaintemp.txt
cat RandomnessPlayer1OnServer.bin >> BingoChaintemp.txt
echo >> BingoChaintemp.txt
echo "END TRANSACTION 1" >> BingoChaintemp.txt

sed -n '/BEGIN BLOCK 2/,/END BLOCK 2/p' BingoChain.txt > BingoChainCommitments.txt

if grep -q -f Player1publickey.pem BingoChainCommitments.txt; then
    output=0;
else
    echo "Il Player 1 non è stato inserito tra i partecipanti della partita"
    rm BingoChaintemp.txt
    exit 1
fi

strings BingoChainCommitments.txt | grep "concatenatedPlayer1" > CommitmentPublishedByPlayer1.bin


if cmp -s OpenedCommitmentPlayer1OnChain.bin CommitmentPublishedByPlayer1.bin; then
    output=0
    echo "OK"
else
    echo "L'apertura del Player 1 non è valida"
    rm BingoChaintemp.txt
    exit 1
fi



echo "BEGIN TRANSACTION 2" >> BingoChaintemp.txt
cat Player2publickey.pem >> BingoChaintemp.txt

cat -b ContributoPlayer2OnServer.bin RandomnessPlayer2OnServer.bin > concatenatedPlayer2.bin
openssl dgst -sha256 concatenatedPlayer2.bin > OpenedCommitmentPlayer2OnChain.bin

echo >> ContributoPlayer2OnServer.bin
echo >> RandomnessPlayer2OnServer.bin
cat ContributoPlayer2OnServer.bin >> BingoChaintemp.txt
cat Randomness2OnServer.bin >> BingoChaintemp.txt
echo >> BingoChaintemp.txt
echo "END TRANSACTION 2" >> BingoChaintemp.txt

if grep -q -f Player2publickey.pem BingoChainCommitments.txt; then
    output=0;
else
    echo "Il Player 2 non è stato inserito tra i partecipanti della partita"
    rm BingoChaintemp.txt
    exit 1
fi

strings BingoChainCommitments.txt | grep "concatenatedPlayer2" > CommitmentPublishedByPlayer2.bin


if cmp -s OpenedCommitmentPlayer2OnChain.bin CommitmentPublishedByPlayer2.bin; then
    output=0
    echo "OK"
else
    echo "L'apertura del Player 2 non è valida"
    rm BingoChaintemp.txt
    exit 1
fi


echo "BEGIN TRANSACTION 3" >> BingoChaintemp.txt
cat Player3publickey.pem >> BingoChaintemp.txt

cat -b ContributoPlayer3OnServer.bin RandomnessPlayer3OnServer.bin > concatenatedPlayer3.bin
openssl dgst -sha256 concatenatedPlayer3.bin > OpenedCommitmentPlayer3OnChain.bin

echo >> ContributoPlayer3OnServer.bin
echo >> RandomnessPlayer3OnServer.bin
cat ContributoPlayer3OnServer.bin >> BingoChaintemp.txt
cat RandomnessPlayer3OnServer.bin >> BingoChaintemp.txt
echo >> BingoChaintemp.txt
echo "END TRANSACTION 3" >> BingoChaintemp.txt

if grep -q -f Player3publickey.pem BingoChainCommitments.txt; then
    output=0;
else
    echo "Il Player 3 non è stato inserito tra i partecipanti della partita"
    rm BingoChaintemp.txt
    exit 1
fi

strings BingoChainCommitments.txt | grep "concatenatedPlayer3" > CommitmentPublishedByPlayer3.bin


if cmp -s OpenedCommitmentPlayer3OnChain.bin CommitmentPublishedByPlayer3.bin; then
    output=0
    echo "OK"
else
    echo "L'apertura del Player 3 non è valida"
    rm BingoChaintemp.txt
    exit 1
fi



echo "BEGIN TRANSACTION 4" >> BingoChaintemp.txt
cat Player4publickey.pem >> BingoChaintemp.txt

cat -b ContributoPlayer4OnServer.bin RandomnessPlayer4OnServer.bin > concatenatedPlayer4.bin
openssl dgst -sha256 concatenatedPlayer4.bin > OpenedCommitmentPlayer4OnChain.bin

echo >> ContributoPlayer4OnServer.bin
echo >> RandomnessPlayer4OnServer.bin
cat ContributoPlayer4OnServer.bin >> BingoChaintemp.txt
cat RandomnessPlayer4OnServer.bin >> BingoChaintemp.txt
echo >> BingoChaintemp.txt
echo "END TRANSACTION 4" >> BingoChaintemp.txt

if grep -q -f Player4publickey.pem BingoChainCommitments.txt; then
    output=0;
else
    echo "Il Player 4 non è stato inserito tra i partecipanti della partita"
    rm BingoChaintemp.txt
    exit 1
fi

strings BingoChainCommitments.txt | grep "concatenatedPlayer4" > CommitmentPublishedByPlayer4.bin


if cmp -s OpenedCommitmentPlayer4OnChain.bin CommitmentPublishedByPlayer4.bin; then
    output=0
    echo "OK"
else
    echo "L'apertura del Player 4 non è valida"
    rm BingoChaintemp.txt
    exit 1
fi


echo "BEGIN TRANSACTION 5" >> BingoChaintemp.txt
cat Bancopublickey.pem >> BingoChaintemp.txt

cat -b ContributoBanco.bin RandomnessBanco.bin > concatenatedBanco.bin
openssl dgst -sha256 concatenatedBanco.bin > OpenedCommitmentBancoOnChain.bin

echo >> ContributoBanco.bin
echo >> RandomnessBanco.bin
cat ContributoBanco.bin >> BingoChaintemp.txt
cat RandomnessBanco.bin >> BingoChaintemp.txt
echo >> BingoChaintemp.txt
echo "END TRANSACTION 5" >> BingoChaintemp.txt

if grep -q -f Bancopublickey.pem BingoChainCommitments.txt; then
    output=0;
else
    echo "Il Banco non è stato inserito tra i partecipanti della partita"
    rm BingoChaintemp.txt
    exit 1
fi

strings BingoChainCommitments.txt | grep "concatenatedBanco" > CommitmentPublishedByBanco.bin


if cmp -s OpenedCommitmentBancoOnChain.bin CommitmentPublishedByBanco.bin; then
    output=0
    echo "OK"
else
    echo "L'apertura del Banco non è valida"
    rm BingoChaintemp.txt
    exit 1
fi

echo "END BLOCK 3" >> BingoChaintemp.txt
cat BingoChaintemp.txt >> BingoChain.txt


