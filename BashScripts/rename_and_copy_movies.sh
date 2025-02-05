#!/bin/bash

# Source directory where movies are stored
SOURCE_DIR="/mnt/sgFourTr/sambaShare/qBtDowmloads"

# Destination directory where renamed movies will be copied
DEST_DIR="/mnt/sgFourTr/sambaShare/JellyfinLibs/Movies"

# Ensure the destination directory exists
#mkdir -p "$DEST_DIR"

# Loop through each movie folder
find "$SOURCE_DIR" -type f -name "*.mp4" | while read -r file; do
    # Extract directory name (movie title with year)
    folder_name=$(basename "$(dirname "$file")")

    # Extract the year (four-digit number in parentheses)
    if [[ $folder_name =~ (.*)\(([0-9]{4})\) ]]; then
        movie_name="${BASH_REMATCH[1]}"
        year="${BASH_REMATCH[2]}"
    else
        echo "Skipping: $file (Could not extract year)"
        continue
    fi

    # Clean up the movie name (remove trailing spaces)
    movie_name=$(echo "$movie_name" | sed 's/\s*$//')

    # Construct new file name
    new_filename="${movie_name} (${year}).mp4"

    # Copy to destination folder with the new name
    cp "$file" "$DEST_DIR/$new_filename"

    echo "Copied: $file → $DEST_DIR/$new_filename"
done
