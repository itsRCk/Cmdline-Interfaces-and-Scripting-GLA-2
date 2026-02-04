#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Error: Exactly one argument is required."
    exit 1
fi

path="$1"

if [ ! -e "$path" ]; then
    echo "Error: Path doesn't exist."
    exit 1
fi

if [ -f "$path" ]; then
    lines=$(wc -l < "$path")
    words=$(wc -w < "$path")
    chars=$(wc -c < "$path")

    echo "File analysis:"
    echo "Lines: $lines"
    echo "Words: $words"
    echo "Characters: $chars"

elif [ -d "$path" ]; then
    total_files=$(find "$path" -type f | wc -l)
    txt_files=$(find "$path" -type f -name "*.txt" | wc -l)

    echo "Directory analysis:"
    echo "Total files: $total_files"
    echo "Total (.txt) files: $txt_files"

else
    echo "Error: Invalid file type."
    exit 1
fi
