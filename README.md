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
