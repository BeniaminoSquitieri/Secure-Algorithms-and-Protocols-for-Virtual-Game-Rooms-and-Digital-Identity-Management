echo "BEGIN BLOCK 1" >> BingoChaintemp.txt
echo "BEGIN TRANSACTION 1" >> BingoChaintemp.txt
cat requestToPartecipatePlayer1OnServer.txt >> BingoChaintemp.txt
cat signatureOfRequestPlayer1OnServer.bin >> BingoChaintemp.txt
echo >> BingoChaintemp.txt
echo "END TRANSACTION 1" >> BingoChaintemp.txt

if grep -q "200BingoCoin" requestToPartecipatePlayer1OnServer.txt; then
    output=$(openssl dgst -verify Player1publickey.pem -signature signatureOfRequestPlayer1OnServer.bin requestToPartecipatePlayer1OnServer.txt)

    if [ "$output" == "Verified OK" ]; then
        output=0
    else
        echo "La firma del Player 1 non è valida"
	rm BingoChaintemp.txt
	exit 1
    fi

else
    rm BingoChaintemp.txt
    echo "Cryptovaluta diversa da 200BingoCoin per il Player 1"
    exit 1
fi

echo "BEGIN TRANSACTION 2" >> BingoChaintemp.txt
cat requestToPartecipatePlayer2OnServer.txt >> BingoChaintemp.txt
cat signatureOfRequestPlayer2OnServer.bin >> BingoChaintemp.txt
echo >> BingoChaintemp.txt
echo "END TRANSACTION 2" >> BingoChaintemp.txt

if grep -q "200BingoCoin" requestToPartecipatePlayer2OnServer.txt; then
    output=$(openssl dgst -verify Player2publickey.pem -signature signatureOfRequestPlayer2OnServer.bin requestToPartecipatePlayer2OnServer.txt)

    if [ "$output" == "Verified OK" ]; then
        output=0
    else
        echo "La firma del Player 2 non è valida"
        rm BingoChaintemp.txt
        exit 1
    fi

else
    rm BingoChaintemp.txt
    echo "Cryptovaluta diversa da 200BingoCoin per il Player 2"
    exit 1
fi

echo "BEGIN TRANSACTION 3" >> BingoChaintemp.txt
cat requestToPartecipatePlayer3OnServer.txt >> BingoChaintemp.txt
cat signatureOfRequestPlayer3OnServer.bin >> BingoChaintemp.txt
echo >> BingoChaintemp.txt
echo "END TRANSACTION 3" >> BingoChaintemp.txt

if grep -q "200BingoCoin" requestToPartecipatePlayer3OnServer.txt; then
    output=$(openssl dgst -verify Player3publickey.pem -signature signatureOfRequestPlayer3OnServer.bin requestToPartecipatePlayer3OnServer.txt)

    if [ "$output" == "Verified OK" ]; then
        output=0
    else
        echo "La firma del Player 3 non è valida"
        rm BingoChaintemp.txt
        exit 1
    fi

else
    rm BingoChaintemp.txt
    echo "Cryptovaluta diversa da 200BingoCoin per il Player 3"
    exit 1
fi

echo "BEGIN TRANSACTION 4" >> BingoChaintemp.txt
cat requestToPartecipatePlayer4OnServer.txt >> BingoChaintemp.txt
cat signatureOfRequestPlayer4OnServer.bin >> BingoChaintemp.txt
echo >> BingoChaintemp.txt
echo "END TRANSACTION 4" >> BingoChaintemp.txt

if grep -q "200BingoCoin" requestToPartecipatePlayer4OnServer.txt; then
    output=$(openssl dgst -verify Player4publickey.pem -signature signatureOfRequestPlayer4OnServer.bin requestToPartecipatePlayer4OnServer.txt)

    if [ "$output" == "Verified OK" ]; then
        output=0
    else
        echo "La firma del Player 4 non è valida"
        rm BingoChaintemp.txt
        exit 1
    fi

else
    rm BingoChaintemp.txt
    echo "Cryptovaluta diversa da 200BingoCoin per il Player 4"
    exit 1
fi

cat Bancopublickey.pem > requestToPartecipateBanco.txt
echo 200BingoCoin >> requestToPartecipateBanco.txt
#openssl dgst -verify Player1publickey.pem -signature signatureOfRequestPlayer1.bin requestToPartecipate.txt
openssl dgst -sign Bancoprivatekey.pem -out signatureOfRequestBanco.bin requestToPartecipateBanco.txt

echo "BEGIN TRANSACTION 5" >> BingoChaintemp.txt
cat requestToPartecipateBanco.txt >> BingoChaintemp.txt
cat signatureOfRequestBanco.bin >> BingoChaintemp.txt
echo >> BingoChaintemp.txt
echo "END TRANSACTION 5" >> BingoChaintemp.txt

if grep -q "200BingoCoin" requestToPartecipateBanco.txt; then
    output=$(openssl dgst -verify Bancopublickey.pem -signature signatureOfRequestBanco.bin requestToPartecipateBanco.txt)

    if [ "$output" == "Verified OK" ]; then
        output=0
    else
        echo "La firma del Banco non è valida"
        rm BingoChaintemp.txt
        exit 1
    fi

else
    rm BingoChaintemp.txt
    echo "Cryptovaluta diversa da 200BingoCoin per il Banco"
    exit 1
fi

echo "END BLOCK 1" >> BingoChaintemp.txt
cat BingoChaintemp.txt >> BingoChain.txt
