filesize=$(wc -c < "$1")
byte_to_keep=$((filesize - 2))
byte_to_remove=$((filesize))
echo $byte_to_keep
echo $byte_to_remove
head -c $byte_to_keep "$1" > "$2"
tail -c +$byte_to_remove "$1" >> "$2"
