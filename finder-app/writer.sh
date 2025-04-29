#!/bin/bash

if [ $# -lt 2 ]; then
    echo "Error: Missing required parameters"
    echo "Usage: $0 <writefile> <writestr>"
    exit 1
fi

writefile=$1
writestr=$2

dirpath=$(dirname "$writefile")

# Create the directory path, error message on failure
mkdir -p "$dirpath" 2>/dev/null
if [ $? -ne 0 ]; then
    echo "Error: Failed to create directory path: $dirpath"
    exit 1
fi

# Write the string to the file, error message on failure
echo "$writestr" > "$writefile" 2>/dev/null
if [ $? -ne 0 ]; then
    echo "Error: Failed to write to file: $writefile"
    exit 1
fi

echo "File written successfully: $writefile"
exit 0