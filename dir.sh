#!/bin/bash

# Print the current directory
current_directory=$(pwd)
echo "Current directory: $current_directory"

# Search for specific directories in the Documents and Pictures directories
search_directories=("jpeg" "pwd" "root")
documents_directory="/mnt/chromeos/MyFiles/Documents"
pictures_directory="/mnt/chromeos/MyFiles/Pictures"

# Function to search and print results
search_and_print() {
    local directory=$1
    for dir_name in "${search_directories[@]}"; do
        echo -e "\nSearch results for directory '$dir_name' in $directory:"
        
        found_directories=$(find "$directory" -type d -name "$dir_name" -print 2>/dev/null)

        if [ -z "$found_directories" ]; then
            echo "Directory not found."
        else
            echo "$found_directories"
        fi
    done
}

# Search in Documents directory
search_and_print "$documents_directory"

# Search in Pictures directory
search_and_print "$pictures_directory"
