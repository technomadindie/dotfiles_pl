#!/bin/bash

# Get the current directory
current_dir=$(pwd)

# Go to the main directory (assuming it's the home directory)
cd ~

# Function to safely remove a file or directory
safe_remove() {
    if [[ -d "$1" && ! -L "$1" ]]; then
        rm -rf "$1"
    else
        rm -f "$1"
    fi
}

# Get list of files and directories, excluding . and ..
files=($(ls -A "$current_dir"))

# Display files with numbers
echo "Files and directories in $current_dir:"
for i in "${!files[@]}"; do
    echo "$((i+1))) ${files[$i]}"
done

# Ask user to select files
echo "Enter the numbers of the files/directories you want to create symlinks for (separated by spaces),"
echo "or enter 'all' to select all, or 'q' to quit:"
read -r selection

if [[ "$selection" == "q" ]]; then
    echo "Exiting script."
    exit 0
fi

if [[ "$selection" == "all" ]]; then
    selected_indices=$(seq 0 $((${#files[@]} - 1)))
else
    selected_indices=()
    for num in $selection; do
        selected_indices+=($((num - 1)))
    done
fi

# Process selected files
for i in "${selected_indices[@]}"; do
    filename="${files[$i]}"
    if [[ -L "$HOME/$filename" ]]; then
        echo "Symlink for $filename already exists in home directory. Overwrite? (y/n)"
        read -r answer
        if [[ "$answer" == "y" ]]; then
            safe_remove "$HOME/$filename"
            ln -s "$current_dir/$filename" "$HOME/$filename"
            echo "Overwritten symlink for $filename"
        else
            echo "Skipped $filename"
        fi
    elif [[ -e "$HOME/$filename" ]]; then
        echo "File/directory $filename already exists in home directory and is not a symlink. Replace? (y/n)"
        read -r answer
        if [[ "$answer" == "y" ]]; then
            safe_remove "$HOME/$filename"
            ln -s "$current_dir/$filename" "$HOME/$filename"
            echo "Replaced $filename with symlink"
        else
            echo "Skipped $filename"
        fi
    elif [[ -e "$current_dir/$filename" ]]; then
        ln -s "$current_dir/$filename" "$HOME/$filename"
        echo "Created symlink for $filename"
    else
        echo "Error: $filename not found in $current_dir"
    fi
done

echo "Script completed. Symlinks created as requested."
