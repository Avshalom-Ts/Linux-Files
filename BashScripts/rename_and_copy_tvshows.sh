#!/bin/bash

# Source and Destination directories
SOURCE_DIR="/mnt/sgFourTr/sambaShare/qBtDowmloads/TvShows/"
DEST_DIR="/mnt/sgFourTr/sambaShare/JellyfinLibs/TvShows"

# Create destination directory if it doesn't exist
#mkdir -p "$DEST_DIR"

# Find all video files in the source directory
find "$SOURCE_DIR" -type f \( -iname "*.mkv" -o -iname "*.mp4" \) | while read -r file; do
    # Extract the parent folder name (TV show root folder)
    parent_folder=$(basename "$(dirname "$(dirname "$file")")")

    # Extract the season folder name
    season_folder=$(basename "$(dirname "$file")")

    # Extract the season and episode number using regex
    if [[ $file =~ S([0-9]{2})E([0-9]{2}) ]]; then
        season_number="${BASH_REMATCH[1]}"
        episode_number="${BASH_REMATCH[2]}"
    else
        echo "Skipping: $file (Could not extract season/episode info)"
        continue
    fi

    # Remove dots from the parent folder name to construct the series name
    series_name=$(echo "$parent_folder" | sed -E 's/\./ /g' | sed -E 's/\s+Season.*//')

    # Extract year if available (assumes format: "Series Name (YYYY)")
    if [[ $series_name =~ (.*)\(([0-9]{4})\) ]]; then
        show_name="${BASH_REMATCH[1]}"
        year="${BASH_REMATCH[2]}"
    else
        show_name="$series_name"
        year=""
    fi

    # Construct the clean series folder name
    if [[ -n "$year" ]]; then
        show_folder="${show_name}(${year})"
    else
        show_folder="${show_name}"
    fi

    # Construct the season folder name
    season_folder_clean="Season $season_number"

    # Create the required directories
    mkdir -p "$DEST_DIR/$show_folder/$season_folder_clean"

    # Construct the new filename
    new_filename="${show_name} S${season_number}E${episode_number}.${file##*.}"

    # Copy the file to the destination
    cp "$file" "$DEST_DIR/$show_folder/$season_folder_clean/$new_filename"

    echo "Copied: $file → $DEST_DIR/$show_folder/$season_folder_clean/$new_filename"
done

