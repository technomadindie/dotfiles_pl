#!/bin/bash

# Get the current directory
current_dir=$(pwd)

# Perform ls -altr and save the output
ls_output=$(ls -altr)

# Save the output to a file
echo "$ls_output" > "$current_dir/files_list.txt"

# Go to the main directory (assuming it's the home directory)
cd ~

# Function to ask for confirmation
confirm() {
    read -p "$1 (y/n): " -n 1 -r
    echo
    [[ $REPLY =~ ^[Yy]$ ]]
}

# Function to safely remove a file or directory
safe_remove() {
    if [[ -d "$1" && ! -L "$1" ]]; then
        rm -rf "$1"
    else
        rm -f "$1"
    fi
}

# Create symbolic links for files/folders
while IFS= read -r line; do
    # Extract filename from ls output
    filename=$(echo "$line" | awk '{print $NF}')
    
    # Skip . and .. entries
    if [[ "$filename" == "." || "$filename" == ".." ]]; then
        continue
    fi

    if confirm "Create symlink for $filename?"; then
        if [[ -L "$HOME/$filename" ]]; then
            echo "Symlink for $filename already exists in home directory"
            if confirm "Delete existing symlink in home directory and create new symlink?"; then
                safe_remove "$HOME/$filename"
                ln -s "$current_dir/$filename" "$HOME/$filename"
                echo "Deleted existing symlink and created new symlink for $filename"
            else
                echo "Kept existing symlink for $filename"
            fi
        elif [[ -e "$HOME/$filename" ]]; then
            echo "File/directory $filename already exists in home directory and is not a symlink"
            if confirm "Delete existing file/directory in home directory and create symlink?"; then
                safe_remove "$HOME/$filename"
                ln -s "$current_dir/$filename" "$HOME/$filename"
                echo "Deleted existing file/directory and created symlink for $filename"
            else
                echo "Kept existing file/directory $filename"
            fi
        elif [[ -e "$current_dir/$filename" ]]; then
            ln -s "$current_dir/$filename" "$HOME/$filename"
            echo "Created symlink for $filename"
        else
            echo "Error: $filename not found in $current_dir"
        fi
    else
        echo "Skipped $filename"
    fi
done <<< "$ls_output"

echo "Script completed. Files list saved to $current_dir/files_list.txt"
echo "Requested symlinks created in home directory for items found in $current_dir"
