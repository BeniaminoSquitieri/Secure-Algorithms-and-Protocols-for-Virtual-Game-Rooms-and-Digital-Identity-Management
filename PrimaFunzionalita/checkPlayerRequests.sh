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

echo "I controlli da parte del Banco sono andati a buon fine"
