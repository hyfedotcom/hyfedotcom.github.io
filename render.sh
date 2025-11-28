#!/bin/bash

# Exit on error
set -e

# Root directory (default to current directory if none provided)
ROOT_DIR="${1:-.}"

# Destination directory
DEST_DIR="$HOME/Desktop/hyfedotcom.github.io"

# Path to style.css (assumed to be in ROOT_DIR)
STYLE_FILE="$ROOT_DIR/style.css"

if [ ! -f "$STYLE_FILE" ]; then
    echo "ERROR: $STYLE_FILE not found. Make sure style.css is in $ROOT_DIR"
    exit 1
fi

# Find all .md files recursively
find "$ROOT_DIR" -type f -name "*.md" | while read -r mdfile; do
    # Build output filename
    htmlfile="${mdfile%.md}.html"

    # Directory containing the .md file
    md_dir="$(dirname "$mdfile")"

    # Compute relative path from md_dir to style.css using Python (portable)
    css_rel_path="$(python3 - "$md_dir" "$STYLE_FILE" << 'EOF'
import os, sys
md_dir, style_file = sys.argv[1], sys.argv[2]
print(os.path.relpath(style_file, md_dir))
EOF
)"

    echo "Converting: $mdfile -> $htmlfile (css: $css_rel_path)"

    pandoc "$mdfile" -o "$htmlfile" --css "$css_rel_path" --standalone

done

echo "Conversion complete. Copying all contents to $DEST_DIR ..."

# Create destination directory if it doesn't exist
mkdir -p "$DEST_DIR"

# Copy entire folder contents into target directory
rsync -av "$ROOT_DIR"/ "$DEST_DIR"/

echo "Done!"

