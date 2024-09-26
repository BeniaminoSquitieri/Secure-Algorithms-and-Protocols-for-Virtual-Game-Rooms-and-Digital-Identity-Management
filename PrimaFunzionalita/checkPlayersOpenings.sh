cat -b ContributoPlayer1OnServer.bin RandomnessPlayer1OnServer.bin > concatenatedPlayer1.bin
openssl dgst -sha256 concatenatedPlayer1.bin > OpenedCommitmentPlayer1OnServer.bin

if cmp -s OpenedCommitmentPlayer1OnServer.bin CommitmentPlayer1OnServer.bin; then
  output=0;
else
  echo "L'apertura del commitment del player 1 è fallita"
  exit 1  # Restituisce un codice di errore non zero per indicare l'errore
fi

cat -b ContributoPlayer2OnServer.bin RandomnessPlayer2OnServer.bin > concatenatedPlayer2.bin
openssl dgst -sha256 concatenatedPlayer2.bin > OpenedCommitmentPlayer2OnServer.bin

if cmp -s OpenedCommitmentPlayer2OnServer.bin CommitmentPlayer2OnServer.bin; then
  output=0;
else
  echo "L'apertura del commitment del player 2 è fallita"
  exit 1  # Restituisce un codice di errore non zero per indicare l'errore
fi

cat -b ContributoPlayer3OnServer.bin RandomnessPlayer3OnServer.bin > concatenatedPlayer3.bin
openssl dgst -sha256 concatenatedPlayer3.bin > OpenedCommitmentPlayer3OnServer.bin

if cmp -s OpenedCommitmentPlayer3OnServer.bin CommitmentPlayer3OnServer.bin; then
  output=0;
else
  echo "L'apertura del commitment del player 3 è fallita"
  exit 1  # Restituisce un codice di errore non zero per indicare l'errore
fi

cat -b ContributoPlayer4OnServer.bin RandomnessPlayer4OnServer.bin > concatenatedPlayer4.bin
openssl dgst -sha256 concatenatedPlayer4.bin > OpenedCommitmentPlayer4OnServer.bin

if cmp -s OpenedCommitmentPlayer4OnServer.bin CommitmentPlayer4OnServer.bin; then
  output=0;
else
  echo "L'apertura del commitment del player 4 è fallita"
  exit 1  # Restituisce un codice di errore non zero per indicare l'errore
fi

echo "L'apertura dei commitment è andata a buon fine"
