#!/bin/zsh -euo pipefail

#set -x

IMAGE_NAME_PREFIX="localhost:5000/toolship/"

# Get the parent directory of this script
scriptdir=${0:a:h}

# Create an empty build/.toolship.zsh file
: > "$scriptdir"/build/.toolship.zsh

# Loop on all the items in src/
for dir in "$scriptdir"/src/*; do
    tool_name=$(basename $dir)
    # If the item is a directory
    if [ -d "$dir" ]; then
        # If the directory contains a functions.zsh file
        if [ -f "$dir/functions.zsh" ]; then
            echo -e "\nBuilding $tool_name..."

            echo "# $tool_name" >> "$scriptdir"/build/.toolship.zsh

            # Build the tool's Dockerfile if it exists
            image_name="$IMAGE_NAME_PREFIX$tool_name" 
            if [ -f "$dir/Dockerfile" ]; then
                docker build -t "$image_name" $dir
            fi

            # Append the tool's functions.zsh file to build/.toolship.zsh, replacing $TOOLSHIP_IMAGE_NAME with the image name
            cat "$dir/functions.zsh" | sed "s#\$TOOLSHIP_IMAGE_NAME#$image_name#g" >> "$scriptdir"/build/.toolship.zsh
            echo -e "\n" >> "$scriptdir"/build/.toolship.zsh
        fi
    fi
done

echo -e "\nAll done! To use the toolship tools, move the functions file to your HOME directory, source it in your .zshenv file, and then restart your shell:\n---"
echo "mv $scriptdir/build/.toolship.zsh ~/.toolship.zsh"
echo "echo \"source ~/.toolship.zsh\" >> ~/.zshenv"
echo "exec zsh"
echo "---"

echo -e "\nAlready using toolship? Just move the functions file to your HOME directory and restart your shell:\n---"
echo "mv $scriptdir/build/.toolship.zsh ~/.toolship.zsh"
echo "exec zsh"
echo "---"