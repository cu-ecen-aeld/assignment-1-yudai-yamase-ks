#!/bin/bash

# 10) Write a shell script finder-app/writer.sh as described below

    # Accepts the following arguments: the first argument is a full path to a file (including filename) on the filesystem, referred to below as writefile;
    # the second argument is a text string which will be written within this file, referred to below as writestr

    # Exits with value 1 error and print statements if any of the arguments above were not specified

    # Creates a new file with name and path writefile with content writestr, overwriting any existing file and creating the path if it doesn’t exist. Exits with value 1 and error print statement if the file could not be created.

# Example:

       # writer.sh /tmp/aesd/assignment1/sample.txt ios

# Creates file:

    # /tmp/aesd/assignment1/sample.txt

            # With content:

            # ios

if [ "$#" -lt 2 ]; then
    echo "Error: missing arguments"
    echo "The number of args is $#"
    exit 1
fi

if [ ! -f "$1" ]; then
    # create the file
    # get the directory path from the file path
    # dirname strips the file name from the path and returns the directory path
    dir_path=$(dirname "$1")
    file_name=$(basename "$1")

    mkdir -p "$dir_path" 2>/dev/null && echo "$2" > "$1" 2>/dev/null

else
    echo "$2" > "$1" 2>/dev/null
fi
