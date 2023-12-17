#!/bin/bash

# Print the current directory
current_directory=$(pwd)
echo "Current directory: $current_directory"

# Search for specific directories and print the results
search_directories=("jpeg" "pwd" "root")

for dir_name in "${search_directories[@]}"; do
    echo -e "\nSearch results for directory '$dir_name':"
    
    found_directories=$(find / -type d -name "$dir_name" -print 2>/dev/null)

    if [ -z "$found_directories" ]; then
        echo "Directory not found."
    else
        echo "$found_directories"
    fi
done
