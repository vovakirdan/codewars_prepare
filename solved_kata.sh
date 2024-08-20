#!/bin/bash

function solved() {
    local env_file=".env"
    local readme_file="README.md"

    # 1) Check if .env file exists
    if [ ! -f "$env_file" ]; then
        echo "Error: .env file not found. Are you in the correct directory?"
        exit 1
    fi

    # 2) Check if it is a kata path
    if ! grep -q "kata=true" "$env_file"; then
        echo "Error: This is not a kata project."
        exit 1
    fi

    # 3) Check if it is already solved
    if grep -q "solved=true" "$env_file"; then
        echo "This kata has already been marked as solved."
        exit 0
    fi

    # 4) Mark the kata as solved in .env file
    sed -i 's/solved=false/solved=true/' "$env_file"

    # 5) Update the README.md to reflect the solved status
    if [ -f "$readme_file" ]; then
        project_name=$(grep -m 1 "^# " "$readme_file" | cut -d' ' -f2-)
        sed -i "s/# ${project_name} NOT SOLVED/# ${project_name} SOLVED/" "$readme_file"
    else
        echo "Warning: README.md not found."
    fi

    # 6) Commit and push the changes
    git add "$env_file" "$readme_file"
    git commit -m "Marked kata as solved"
    git push

    echo "Kata marked as solved and changes pushed to GitHub!"
}
