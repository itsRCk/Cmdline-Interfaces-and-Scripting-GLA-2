#!/bin/bash

# Check if exactly one argument is provided
if [ $# -ne 1 ]; then
    echo "Usage: $0 <input_file>"
    exit 1
fi

input_file=$1

# Check if file exists
if [ ! -f "$input_file" ]; then
    echo "Error: File does not exist"
    exit 1
fi

# Clear output files
> vowels.txt
> consonants.txt
> mixed.txt

# Convert input to lowercase, extract words, and process
tr '[:upper:]' '[:lower:]' < "$input_file" | tr -c 'a-z' '\n' | while read word
do
    if [[ $word =~ ^[aeiou]+$ ]]; then
        echo "$word" >> vowels.txt

    elif [[ $word =~ ^[bcdfghjklmnpqrstvwxyz]+$ ]]; then
        echo "$word" >> consonants.txt

    elif [[ $word =~ ^[bcdfghjklmnpqrstvwxyz][a-z]*$ ]] &&
         [[ $word =~ [aeiou] ]] &&
         [[ $word =~ [bcdfghjklmnpqrstvwxyz] ]]; then
        echo "$word" >> mixed.txt
    fi
done
