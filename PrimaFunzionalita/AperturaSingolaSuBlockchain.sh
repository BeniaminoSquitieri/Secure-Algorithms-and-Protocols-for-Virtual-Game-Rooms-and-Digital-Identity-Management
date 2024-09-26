rm BingoChaintemp.txt
rm BingoChainCommitments.txt
echo "BEGIN BLOCK $1">> BingoChaintemp.txt
echo "BEGIN TRANSACTION 1" >> BingoChaintemp.txt
cat "$2" >> BingoChaintemp.txt


cat -b "$3""$4" > concatenatedPlayer"$5".bin
openssl dgst -sha256 concatenatedPlayer"$5".bin > OpenedCommitmentPlayerOnChain.bin

echo >> "$3"
echo >> "$4"
cat "$3" >> BingoChaintemp.txt
cat "$4" >> BingoChaintemp.txt
echo >> BingoChaintemp.txt
echo "END TRANSACTION 1" >> BingoChaintemp.txt

sed -n '/BEGIN BLOCK 2/,/END BLOCK 2/p' BingoChain.txt > BingoChainCommitments.txt

if grep -q -f "$2" BingoChainCommitments.txt; then
    output=0;
else
    echo "Non sei stato inserito tra i partecipanti della partita"
    rm BingoChaintemp.txt
    exit 1
fi

strings BingoChainCommitments.txt | grep "concatenatedPlayer$5" > CommitmentPublishedByPlayer.bin


if cmp -s OpenedCommitmentPlayerOnChain.bin CommitmentPublishedByPlayer.bin; then
    output=0
    echo "OK"
else
    echo "L'apertura non è valida"
    rm BingoChaintemp.txt
    exit 1
fi

echo "BEGIN END $1" >> BingoChaintemp.txt
cat BingoChaintemp.txt >> BingoChain.txt
