while true; do
        if grep -q "messaggio_da_cercare" output3.txt; then
                break
        fi
        sleep 1
done

tail -n 1 output3.txt > Qualcosa.bin
