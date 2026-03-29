#!/bin/bash
# Remove all files matched by .gitignore patterns, recursively.
# Excludes the .git directory.

cd "$(dirname "$0")" || exit 1

while IFS= read -r pattern; do
    # Skip blank lines and comments
    [[ -z "$pattern" || "$pattern" == \#* ]] && continue
    # Find and remove matching files, excluding .git directory
    find . -not -path './.git/*' -name "$pattern" -type f -print -delete
done < .gitignore

echo "Cleaned auxiliary files."
