# Explanation – Shell Script Implementation

The script accepts exactly one command-line argument and validates it using `$#` and tests operators to ensure the input exists and is accessible. Invalid arguments result in well-defined error messages and immediate termination.

For file inputs, the script uses `wc` to count lines, words, and characters. For directory inputs, `find` is used to count total files and `.txt` files, with conditional checks (`-f` and `-d`) determining the correct operation.

The log analysis script validates log file readability, and individually counts INFO, WARNING, and ERROR messages using `wc` and `grep`, identifies the most recent ERROR entry, and generates a date-based summary report. Both scripts implement graceful error handling to prevent unexpected failures.
