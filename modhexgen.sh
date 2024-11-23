#!/bin/bash

# Default values
size=32
charset="bcdefghijklnrtuv"
uppercase=false
lowercase=false

# Function to display usage
usage() {
    echo "Usage: $0 [-s size] [-u] [-l] [-h]"
    echo
    echo "Options:"
    echo "  -s SIZE   Specify size of the output (1-4096). Default: 32"
    echo "  -u        Use uppercase characters only."
    echo "  -l        Use lowercase characters only."
    echo "  -h        Show this help message and exit."
    echo
    echo "Notes:"
    echo "  By default, the output includes both uppercase and lowercase characters."
    echo "  Using both -u and -l at the same time is not allowed."
    exit 0
}

# Parse command-line arguments
while getopts "s:ulh" opt; do
    case "$opt" in
        s)
            size="$OPTARG"
            if ! [[ "$size" =~ ^[0-9]+$ ]] || [ "$size" -le 0 ] || [ "$size" -gt 4096 ]; then
                echo "Error: Size must be an integer between 1 and 4096."
                exit 1
            fi
            ;;
        u)
            uppercase=true
            ;;
        l)
            lowercase=true
            ;;
        h)
            usage
            ;;
        ?)
            usage
            ;;
    esac
done

# Check for conflicting options
if $uppercase && $lowercase; then
    echo "Error: Both -u and -l cannot be used at the same time."
    exit 1
fi

# Set charset based on flags
if $uppercase; then
    charset=$(echo "$charset" | awk '{print toupper($0)}')
elif $lowercase; then
    charset=$(echo "$charset" | awk '{print tolower($0)}')
else
    # Default: Use both uppercase and lowercase
    charset=$(echo "$charset" | awk '{print toupper($0) $0}')
fi

# Secure random generator using /dev/urandom
generate_modhex() {
    for _ in $(seq 1 "$size"); do
        # Read a single random byte, map it to the charset
        local index=$(( $(od -An -N1 -i /dev/urandom) % ${#charset} ))
        echo -n "${charset:$index:1}"
    done
    echo
}

# Generate and display the output
generate_modhex

