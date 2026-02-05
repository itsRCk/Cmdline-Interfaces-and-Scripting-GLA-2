# Email Validation Script

## Command 1
`grep -E '^[a-zA-Z0-9]+@[a-zA-Z]+\.com$' emails.txt | sort | uniq > valid.txt`
Explanation:
This command filters selects only valid emails from emails.txt using a regular expression, then sorts them and removes duplicate entries before saving the final unique list to valid.txt.

## Command 2
`grep -Ev '^[a-zA-Z0-9]+@[a-zA-Z]+\.com$' emails.txt > invalid.txt`
Explanation:
This command extracts all email addresses that do not match the valid email format and stores them in invalid.txt.