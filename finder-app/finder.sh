#!/bin/bash

# 9) Write a shell script finder-app/finder.sh as described below:

    # Accepts the following runtime arguments: the first argument is a path to a directory on the filesystem, referred to below as filesdir
    # the second argument is a text string which will be searched within these files, referred to below as searchstr

    # Exits with return value 1 error and print statements if any of the parameters above were not specified

    # Exits with return value 1 error and print statements if filesdir does not represent a directory on the filesystem

    # Prints a message "The number of files are X and the number of matching lines are Y" where X is the number of files in the directory and all subdirectories and Y is the number of matching lines found in respective files, where a matching line refers to a line which contains searchstr (and may also contain additional content).

# Example invocation:

    # finder.sh /tmp/aesd/assignment1 linux

# check the number of arguments
if [ "$#" -lt 2 ]; then
    echo "Error: missing arguments"
    echo "The number of args is $#"
    exit 1
fi

# check if the first argument is a directory
if [ ! -d "$1" ]; then
    echo "Error: $1 is not a directory"
    exit 1
else
    echo "$1 is a directory"
fi

num_files=$(find "$1" -type f 2>/dev/null | wc -l )

num_matching_lines=$(grep -r "$2" "$1" 2>/dev/null | wc -l)

echo "The number of files are $num_files and the number of matching lines are $num_matching_lines"