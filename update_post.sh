#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <\"about\" | \"search_string\">"
    exit 1
fi

TARGET=$1

update_date_in_file() {
    local file_path=$1
    if [ ! -f "$file_path" ]; then
        echo "Error: File not found at '$file_path'"
        return 1
    fi

    local new_date
    new_date=$(date +%Y-%m-%dT%H:%M:%S%:z)

    sed -i "s/^date: .*/date: $new_date/" "$file_path"
    
    echo "Date updated successfully in: $file_path"
}

if [ "$TARGET" == "about" ]; then
    ABOUT_FILE="_pages/about.md"
    echo "Updating date in $ABOUT_FILE..."
    update_date_in_file "$ABOUT_FILE"
    exit $?
fi

echo "Searching for posts with \"$TARGET\" in the filename..."
mapfile -t found_files < <(find _posts -type f -name "*$TARGET*.md")

file_count=${#found_files[@]}

if [ "$file_count" -eq 0 ]; then
    # No file found
    echo "Error: No post found with the substring \"$TARGET\" in its filename."
    exit 1
elif [ "$file_count" -gt 1 ]; then
    # Found multiple files
    echo "Error: Multiple files found. Please provide a more unique substring."
    echo "Matching files:"
    for file in "${found_files[@]}"; do
        echo "- $file"
    done
    exit 1
else
    # Found one file
    file_to_update="${found_files[0]}"
    echo "Found one matching file: $file_to_update"
    update_date_in_file "$file_to_update"
    exit $?
fi
