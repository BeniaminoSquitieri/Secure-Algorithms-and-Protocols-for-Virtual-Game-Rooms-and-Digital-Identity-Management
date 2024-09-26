rm Blockchaintemp.txt
echo "BEGIN BLOCK 7" >> BingoChaintemp.txt
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

sed -n '/BEGIN BLOCK 2/,/END BLOCK 2/p' BingoChain.txt > BingoChainCommitments.txt

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

echo "END BLOCK 5" >> BingoChaintemp.txt
cat BingoChaintemp.txt >> BingoChain.txt
