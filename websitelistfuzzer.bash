#!/bin/bash

# Check if a text file is provided as a parameter
if [ $# -eq 0 ]; then
    echo "Error: No file provided"
    exit 1
fi

# Assign the first parameter to a variable
file=$1

# Check if the file exists
if [ ! -f "$file" ]; then
    echo "Error: File not found"
    exit 1
fi

# Loop through the list of websites in the file
while read website; do
    # Run the ffuf command for each website
    ffuf -w /home/kali/ffufwrd/common.txt -u "$website"/FUZZ -mc 200,403
done < "$file"
