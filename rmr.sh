#!/bin/bash
for dirName in "$@"; do
    if [ ! -e "$dirName" ]; then
        echo "File/Directory $dirName does not exist. Skipping."
        continue
    fi

    echo "Are you sure you want to delete the directory $dirName? [y/N]"
    read confirm
    if [ "$confirm" = 'y' ] || [ "$confirm" = 'Y' ] || [ "$confirm" = '' ]; then
        rm -rf $dirName
        echo "Deleted directory $dirName."
    else
        echo "Aborted deletion of $dirName."
    fi
done
