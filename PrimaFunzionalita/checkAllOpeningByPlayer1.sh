cat -b ContributoPlayer2DaServer.bin RandomnessPlayer2DaServer.bin > concatenatedPlayer2.bin
openssl dgst -sha256 concatenatedPlayer2.bin > OpenedCommitmentPlayer2OnPlayer1.bin

if cmp -s OpenedCommitmentPlayer2OnPlayer1.bin CommitmentPlayer2DaServer.bin; then
  output=0;
else
  echo "L'apertura del commitment del player 2 è fallita"
  exit 1  # Restituisce un codice di errore non zero per indicare l'errore
fi

cat -b ContributoPlayer3DaServer.bin RandomnessPlayer3DaServer.bin > concatenatedPlayer3.bin
openssl dgst -sha256 concatenatedPlayer3.bin > OpenedCommitmentPlayer3OnPlayer1.bin

if cmp -s OpenedCommitmentPlayer3OnPlayer1.bin CommitmentPlayer3DaServer.bin; then
  output=0;
else
  echo "L'apertura del commitment del player 3 è fallita"
  exit 1  # Restituisce un codice di errore non zero per indicare l'errore
fi

cat -b ContributoPlayer4DaServer.bin RandomnessPlayer4DaServer.bin > concatenatedPlayer4.bin
openssl dgst -sha256 concatenatedPlayer4.bin > OpenedCommitmentPlayer4OnPlayer1.bin

if cmp -s OpenedCommitmentPlayer4OnPlayer1.bin CommitmentPlayer4DaServer.bin; then
  output=0;
else
  echo "L'apertura del commitment del player 4 è fallita"
  exit 1  # Restituisce un codice di errore non zero per indicare l'errore
fi

cat -b ContributoBancoDaServer.bin RandomnessBancoDaServer.bin > concatenatedBanco.bin
openssl dgst -sha256 concatenatedBanco.bin > OpenedCommitmentBancoOnPlayer1.bin

if cmp -s OpenedCommitmentBancoOnPlayer1.bin CommitmentBancoDaServer.bin; then
  output=0;
else
  echo "L'apertura del commitment del banco è fallita"
  exit 1  # Restituisce un codice di errore non zero per indicare l'errore
fi

echo "Le aperture dei commitment da parte del Player1 sono andate a buone fine"

cat ContributoPlayer1DaServer.bin ContributoPlayer2DaServer.bin ContributoPlayer3DaServer.bin ContributoPlayer4DaServer.bin ContributoBancoDaServer.bin | openssl dgst -sha256 > StringaRandomCalcolataDaPlayer1.bin

if cmp -s StringaRandomCalcolataDalServer.bin StringaRandomCalcolataDaPlayer1.bin; then
  output=0;
else
  echo "La stringa random calcolata è errata"
  exit 1  # Restituisce un codice di errore non zero per indicare l'errore
fi

echo "Anche la stringa random è calcolata correttamente"
