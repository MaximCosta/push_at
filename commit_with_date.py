#!/usr/bin/python3

import argparse
import os
from datetime import datetime


def argsError(e):
    print(f"\033[31m[Error] - {e}\033[0m")
    exit(0)


def push_with_date(commit_add: str, commit_message: str, commit_date: datetime) -> None:
    current_directory: str = os.getcwd()
    commit_date_str: str = commit_date.strftime("%Y-%m-%d %H:%M:%S")

    os.chdir(current_directory)
    os.system(f"git add {commit_add}")
    os.environ["GIT_COMMITTER_DATE"] = commit_date_str
    os.environ["GIT_AUTHOR_DATE"] = commit_date_str
    os.system(f'git commit -m "{commit_message}"')
    os.system("git push")


def check_current_directory() -> None:
    if not os.path.isdir(".git"):
        argsError("Not a git repository")


def main() -> None:
    check_current_directory()

    parser = argparse.ArgumentParser()
    parser.add_argument("-a", "--add", help="git Add option (default: .)")
    parser.add_argument("-m", "--message", help='Commit message (default: "Upadte project")')
    parser.add_argument("-d", "--date", help="Date and time for the commit (format: YYYY-MM-DD HH:MM:SS) (default: current date and time)")
    args = parser.parse_args()

    try:
        commit_add = args.add if "add" in args else "."
        commit_message = args.message if args.message else "Update"
        commit_date = datetime.strptime(args.date, "%Y-%m-%d %H:%M:%S") if args.date else datetime.today()
        push_with_date(commit_add, commit_message, commit_date)
    except ValueError:
        argsError("Invalid date format. Please use \"YYYY-MM-DD HH:MM:SS\".")


if __name__ == "__main__":
    main()
