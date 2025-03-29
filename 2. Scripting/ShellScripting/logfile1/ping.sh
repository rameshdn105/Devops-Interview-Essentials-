#!/bin/bash

awk 'BEGIN{RS="[ \n]"} /http[s]?:\/\//' logfile | tr -d ';")(+' > links.txt

while IFS= read -r line ; do
  ping $line 
  if [ $? -eq 0 ]; then
    echo "$line is reachable"
  else
    echo "$line is not reachable"
  fi
done < links.txt


# while IFS= read -r line: read a file line by line, ensuring that spaces, leading/trailing whitespaces, and special characters are handled correctly.
# while ...; do ... done → Loop that executes commands repeatedly
# IFS= → Clears the Internal Field Separator (IFS) to prevent leading/trailing spaces from being trimmed.
# read -r line → Reads a line of input into the variable line:
# -r prevents \ (backslashes) from being treated as escape characters.
# done < links.txt: feeds the contents of the file links.txt as input to the while loop, allowing it to process each line one by one.