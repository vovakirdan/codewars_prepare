#!/bin/bash

function new() {
    local object_name="$1 kata"
    local kata_link="$2"
    local project_name="$3"
    local language="$4"

    # 0) Sanitize the project name
    local repo_name
    repo_name=$(echo "${project_name}" | tr '[:upper:]' '[:lower:]' | tr -s ' ' '-')

    # 1) Create a path with the sanitized name
    mkdir -p "${project_name} ${object_name}"
    cd "${project_name} ${object_name}" || exit

    # 2) Create a .env file
    echo "kata=true" > .env
    echo "kata_link=${kata_link}" >> .env
    echo "difficulty=${object_name}" >> .env
    echo "solved=false" >> .env

    # 3) Language specific setup
    if [ "$language" == "C" ] || [ "$language" == "C++" ]; then
        # Create a basic Makefile
        cat <<EOL > Makefile
CC=gcc
CFLAGS=-Wall -Wextra

all: main

main: main.o
	\$(CC) \$(CFLAGS) -o main main.o

main.o: main.c
	\$(CC) \$(CFLAGS) -c main.c

clean:
	rm -f *.o main
EOL
        # Create a main source file
        touch main.c
        [ "$language" == "C++" ] && mv main.c main.cpp

    elif [ "$language" == "Python" ] || [ "$language" == "python" ]; then
        # Create a Python virtual environment and activate it
        # python3 -m venv env
        # echo "source env/bin/activate" >> .env
        source /home/zov/projects/venv3/bin/activate
        # Create the main Python file
        touch main.py
    fi

    # 4) Initialize a Git repository
    git init
    git add .
    git commit -m "Initial commit"

    # 5) Setup GitHub repo (optional step, requires user interaction to set up SSH keys, etc.)
    echo "# ${project_name} NOT SOLVED" > README.md
    git add README.md
    git commit -m "Added README.md"
    gh repo create "${repo_name}"
    if [ $? -eq 0 ]; then
        # git remote add origin "https://github.com/vovakirdan/${repo_name}.git"
        git checkout -b main
        git push -u origin main
        echo "Project '${project_name}' initialized and pushed to GitHub successfully!"
    else
        echo "Failed to create the GitHub repository. Please check your GitHub CLI configuration."
    fi
}
