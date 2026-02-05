#!/bin/bash

if [ ! -f input.txt ]; then
    echo "Error: input.txt not found"
    exit 1
fi

words=$(tr -c '[:alnum:]' '[\n*]' < input.txt | tr 'A-Z' 'a-z' | grep -v '^$')

longest=$(echo "$words" | awk '{ print length, $0 }' | sort -nr | head -1 | cut -d" " -f2)

shortest=$(echo "$words" | awk '{ print length, $0 }' | sort -n | head -1 | cut -d" " -f2)

average=$(echo "$words" | awk '{ total += length; count++ } END { printf "%.2f", total/count }')

unique=$(echo "$words" | sort | uniq | wc -l)

echo "Longest word          : $longest"
echo "Shortest word         : $shortest"
echo "Average word length   : $average"
echo "Total unique words    : $unique"
