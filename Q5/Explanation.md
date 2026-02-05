# Shell script to compare 2 directories

## Argument Validation
The script checks if exactly two command-line arguments are provided and verifies that both are valid directories before proceeding.

## Listing Files Only in dirA
The `comm -23` command compares sorted file lists and displays files that exist only in dirA but not in dirB.

## Listing Files Only in dirB
The `comm -13` command lists files that exist only in dirB and are missing from dirA.

## Comparing Common Files
For files present in both directories, the script uses `cmp -s` to silently compare file contents and reports whether they are identical or different.