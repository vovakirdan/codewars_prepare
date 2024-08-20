# Project Setup Script
This script automates the process of creating and setting up a new project repository for solving coding katas or other programming exercises. It supports C, C++, and Python programming languages. The script performs the following tasks:

1. **Sanitizes the project name:** Converts the project name to lowercase and replaces spaces with hyphens to ensure consistency in naming conventions.
2. **Creates a directory structure:** Sets up a directory with the sanitized project name and the specified kata (exercise) name.
3. **Generates a .env file:** Stores metadata about the kata, including the kata link, difficulty, and the solved status.
4. **Performs language-specific setup:**
* For C/C++ projects: Creates a basic `Makefile` and a main source file.
* For Python projects: (_Optionally_) sets up a Python virtual environment and creates a main Python file.
5. **Initializes a Git repository:** Initializes a Git repository, adds all files, and makes an initial commit.
6. **Sets up a GitHub repository:** Optionally creates a public GitHub repository and pushes the initial commit.
## Prerequisites
* **Git:** Make sure Git is installed and configured on your system.
* **GitHub CLI (gh):** The script uses GitHub CLI to create a GitHub repository. Ensure it's installed and authenticated.
* **Python (for Python projects):** If you're working with Python, ensure Python is installed and configured on your system.
* **Virtual Environment (Optional for Python):** The script has commented out lines for setting up a Python virtual environment. Adjust the paths as necessary.
## Usage
To use this script, follow these steps:

1. **Create the script:**

* Save the script in a `.sh` file, for example, `setup_project.sh`.
* Make the script executable by running: `chmod +x setup_project.sh`.
2. **Run the script:**

```bash
./setup_project.sh
```
The script expects four parameters:

* `object_name:` The difficulty or type of the kata (e.g., "easy", "medium", "hard").
* `kata_link:` A URL to the kata or exercise.
* `project_name:` The name of the project.
* `language:` The programming language ("C", "C++", "Python").
Example:

```bash
./setup_project.sh "medium" "https://kata.example.com" "MyProject" "Python"
```
3. **Post-Execution:**

* The script will create a directory for your project and initialize it with the necessary files.
* If the GitHub repository setup is successful, it will push the initial commit to the new repository.
## Customization
You can modify the script to suit your workflow by:

* Adding more language-specific setups.
* Customizing the .env file with additional metadata.
* Adjusting the Git and GitHub setup steps as per your requirements.
## Troubleshooting
* **GitHub Repository Creation Failure:** If the script fails to create the GitHub repository, verify your GitHub CLI configuration and SSH key setup.
* **Virtual Environment:** If you're using a Python virtual environment, make sure to uncomment and adjust the appropriate lines in the script.
=
# `solved` Function
This Bash function, `solved`, is designed to mark a kata (coding exercise) project as solved. It updates the project’s metadata, modifies the README file to reflect the new status, and commits these changes to the associated Git repository. This function is particularly useful for developers who use Git and GitHub to manage their coding kata projects.

## Functionality
The `solved` function performs the following steps:

1. **Check for `.env` File:**
The function first checks if a .env file exists in the current directory. The `.env` file stores project metadata, including the status of the kata. If the file is not found, the function will exit with an error message.

2. **Verify Kata Project:**
The function verifies that the current directory is a kata project by checking for the presence of `kata=true` in the `.env` file. If this is not a kata project, the function exits with an error.

3. **Check Solved Status:**
The function checks whether the kata has already been marked as solved. If it has, the function will notify the user and exit without making any changes.

4. **Mark the Kata as Solved:**
If the kata has not yet been marked as solved, the function updates the `.env` file, changing `solved=false` to `solved=true`.

5. **Update the README.md File:**
If a `README.md` file is present, the function updates the header to indicate that the project is solved (e.g., from `# ProjectName NOT SOLVED` to `# ProjectName SOLVED`). If the `README.md` file is not found, the function issues a warning but continues execution.

6. **Commit and Push Changes:**
The function stages the modified `.env` and `README.md` files, commits them with the message "Marked kata as solved," and pushes the commit to the remote GitHub repository.

## Usage
To use this function:

1. **Ensure the .env file is present** in the project directory and that it contains the kata=true and solved=false entries.
2. **Navigate to the directory** where your kata project is located.
3. **Run the function** by executing the script or sourcing it in your terminal:
```bash
./script_with_solved_function.sh
```
4. Execute the solved function:
```bash
solved
```
Upon successful execution, the kata will be marked as solved, the `README.md` will be updated, and the changes will be committed and pushed to your GitHub repository.

## Error Handling
* **Missing .env File:** The function will exit with an error message if the .env file is not found.
* **Non-Kata Project:** If the current directory is not a kata project, the function will exit with an error.
* **Already Solved:** The function will notify the user if the kata is already marked as solved and will exit without making changes.
## Requirements
* **Git:** Ensure Git is installed and configured for the project.
* **GitHub CLI (Optional):** For automatic pushing to GitHub, ensure your repository is set up correctly with GitHub.
## Customization
You can modify this function to:

* Handle additional project types.
* Customize the commit message.
* Include additional file updates or checks.
