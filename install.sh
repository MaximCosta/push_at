#!/bin/bash

# Check if git is installed and install it if not
if ! [ -x "$(command -v git)" ]; then
    echo "Git is not installed. Installing..."
    sudo apt-get install git
fi

# Check if python 3 is installed and install it if not
if ! [ -x "$(command -v python3)" ]; then
    echo "Python 3 is not installed. Installing..."
    sudo apt-get install python3
fi

# Create a md5sum of online script
md5sum_online=$(curl -sSfL -H 'Cache-Control: no-cache' https://raw.githubusercontent.com/MaximCosta/push_at/main/commit_with_date.py | md5sum | awk '{print $1}')

# Create a md5sum of local script if it exists (~/.local/bin/fpush)
local_script_path="$HOME/.local/bin/fpush"
if [ -f "$local_script_path" ]; then
    md5sum_local=$(md5sum "$local_script_path" | awk '{print $1}')
else
    md5sum_local="0"
fi

# Check if local script is up to date
if [ "$md5sum_online" == "$md5sum_local" ]; then
    echo "Script is up to date."
    exit 0
fi

# Download script
curl -sSfL -H 'Cache-Control: no-cache' https://raw.githubusercontent.com/MaximCosta/push_at/main/commit_with_date.py -o "$local_script_path" >/dev/null 2>&1

# Check if script is downloaded
if [ -f "$local_script_path" ]; then
    echo "Script downloaded successfully."
else
    echo "Script download failed."
    exit 1
fi

chmod +x "$local_script_path"

# Display installation success message
echo "Installation completed successfully."
echo "You can now use the 'fpush' command to execute the script."
echo ""
fpush -h
