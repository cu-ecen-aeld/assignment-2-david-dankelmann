#!/bin/bash

if [ $# -lt 2 ]; then
    echo "Error: Missing required parameters"
    echo "Usage: $0 <filesdir> <searchstr>"
    exit 1
fi

filesdir=$1
searchstr=$2

if [ ! -d "$filesdir" ]; then
    echo "Error: $filesdir is not a directory"
    exit 1
fi

# Count total number of files in dir and subdirs
file_count=$(find "$filesdir" -type f | wc -l)

# Count matching lines
match_count=$(grep -r "$searchstr" "$filesdir" | wc -l)

# Print result
echo "The number of files are $file_count and the number of matching lines are $match_count"

exit 0