# README

This README provides an overview of the code and explains how to use it. The code is a Python script that allows you to commit and push changes to a Git repository with a specified date and time.

## Prerequisites

Before using this script, ensure that you have the following:

- Python 3 installed on your system.
- Git installed and configured on your system.

## Usage

To use the script, follow these steps:

1. Copy the code into a file named `commit_with_date.py`.
2. Open a terminal or command prompt and navigate to the directory where the `commit_with_date.py` file is located.
3. Run the script using the following command:

   ```
   python3 commit_with_date.py [-a ADD] [-m MESSAGE] [-d DATE]
   ```

   The script accepts the following optional arguments:

   - `-a ADD, --add ADD`: The `git add` option. Specifies the files to add to the commit. If not provided, the default is to add all files (`.`).
   - `-m MESSAGE, --message MESSAGE`: The commit message. If not provided, the default is set to "Update".
   - `-d DATE, --date DATE`: The date and time for the commit. Use the format `YYYY-MM-DD HH:MM:SS`. If not provided, the default is the current date and time.

   Note: Make sure to replace `python3` with the appropriate command if `python3` is not recognized on your system.

4. The script will execute the following steps:
   - Adds the specified files or all files (`.`) to the Git staging area using `git add`.
   - Sets the commit date and author date to the specified date or the current date and time.
   - Commits the changes with the provided commit message using `git commit`.
   - Pushes the changes to the remote repository using `git push`.

   Make sure you have the necessary permissions to perform the commit and push actions.

## Examples

Here are some examples of how to use the script:

- Commit and push all files with the default commit message and the current date and time:

  ```
  python3 commit_with_date.py
  ```

- Commit and push all files with a custom commit message and the current date and time:

  ```
  python3 commit_with_date.py -m "Fix bug"
  ```

- Commit and push a specific file with a custom commit message and date:

  ```
  python3 commit_with_date.py -a myfile.txt -m "Add myfile.txt" -d "2023-06-05 14:30:00"
  ```

Note: If you encounter any errors or have issues using the script, please refer to the error messages displayed or seek assistance.
