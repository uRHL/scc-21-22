#!/bin/sh

# Arg 1
INPUT_FILE=$1
OUTPUT_FILE="corinna_larsen_len_check.dic"

# Arg 2
PREFIX=$2

MIN_LEN=6
MAX_LEN=8
touch $OUTPUT_FILE

echo "Original wordlist size: `wc -l $INPUT_FILE`"
echo "\nSelecting words whose size is between $MIN_LEN and $MAX_LEN ...\n"

while read line; do
    # if line.length is valid save the word
    if [ ${#line} -gt $(($MIN_LEN - 1)) ] && [ ${#line} -lt $(($MAX_LEN + 1)) ]; then
	    echo "$PREFIX$line" >> $OUTPUT_FILE
    fi
done < $INPUT_FILE

echo "Output wordlit size: `wc -l $OUTPUT_FILE`"
