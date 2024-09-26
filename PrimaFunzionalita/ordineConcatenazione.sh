sed -n '2,3p' Player1publickey.pem > filetemp1.txt
sed -n '2,3p' Player2publickey.pem > filetemp2.txt
sed -n '2,3p' Player3publickey.pem > filetemp3.txt
sed -n '2,3p' Player4publickey.pem > filetemp4.txt

#cat filetemp1.txt && echo "" && cat filetemp2.txt && echo "" && cat filetemp3.txt && echo "" && cat filetemp4.txt > ordineConcatenazioneVero.txt

file1="filetemp1.txt"
file2="filetemp2.txt"
file3="filetemp3.txt"
file4="filetemp4.txt"

output_file="ordineConcatenazioneVero.txt"


cat "$file1" >> "$output_file"
echo "" >> "$output_file" # Aggiunge una riga di separazione
cat "$file2" >> "$output_file"
echo "" >> "$output_file" # Aggiunge una riga di separazione
cat "$file3" >> "$output_file"
echo "" >> "$output_file" # Aggiunge una riga di separazione
cat "$file4" >> "$output_file"

echo "Concatenazione completata."

# MANDA A CLIENT
