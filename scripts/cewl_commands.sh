#!/bin/sh

# Arg 1
OUTPUT_FILE=$1

touch $OUTPUT_FILE

# min length 6
# depth = 1, just one hop URLs
# lowercase all words
# write output to a file
# conver non latin characters
cewl -m 6  -d 0 --lowercase --convert-umlauts https://en.wikipedia.org/wiki/Corinna_zu_Sayn-Wittgenstein-Sayn >> $OUTPUT_FILE

aux=`wc -l < $OUTPUT_FILE`

echo "Word count from Wikipedia page (English version): $aux"

cewl -m 6  -d 0 --lowercase --convert-umlauts https://es.wikipedia.org/wiki/Corinna_Larsen >> $OUTPUT_FILE

echo "Word count from Wikipedia page (Spanish version): $((`wc -l < $OUTPUT_FILE` - $aux))"

echo "Total word count (English + Spanish version): `wc -l $OUTPUT_FILE`"
