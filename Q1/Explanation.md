# Question 1 – Shell Script: analyze.sh

## Script Creation
A shell script named `analyze.sh` was created using a text editor. The script begins with a shebang (`#!/bin/bash`) to specify the Bash shell for execution.

---

## Argument Count Validation
The script first checks whether exactly one command-line argument is provided using `$#`.  
If the number of arguments is not equal to one, the script prints an error message and exits. This ensures the script is used correctly.

---

## Path Validation
The input argument is stored in a variable and checked using the `-e` test operator to verify whether the given path exists.  
If the path does not exist, an appropriate error message is displayed and the script terminates.

---

## File Analysis
If the provided argument is identified as a file using the `-f` test operator, the script calculates:
- Number of lines using `wc -l`
- Number of words using `wc -w`
- Number of characters using `wc -c`

The results are then displayed clearly to the user.

---

## Directory Analysis
If the argument is identified as a directory using the `-d` test operator, the script:
- Counts the total number of files in the directory using the `find` command
- Counts the number of `.txt` files present in the directory

These values are printed as part of the directory analysis output.

---

## Error Handling
If the argument is neither a valid file nor a directory, the script displays an error message indicating an invalid file type.  
This ensures robustness and proper handling of unexpected inputs.

---

## Conclusion
The script successfully fulfills all the requirements of the problem by validating inputs, distinguishing between files and directories, displaying the correct information, and handling errors gracefully.
