# Text Metrics

The script checks whether `input.txt` exists to avoid runtime errors.

`tr` is then used to replace non-alphanumeric characters with newlines and convert all words to lowercase for consistency.

`awk`, `sort`, and `head` are piped together to identify the longest and shortest words based on length.

`awk` is also used to compute the average word length by summing character counts and dividing by total words.

`sort`, `uniq`, and `wc -l` are used together to calculate the total number of unique words.