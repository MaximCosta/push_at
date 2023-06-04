#!/bin/bash

# Clone the repository
git clone https://github.com/MaximCosta/push_at
cd push_at

# Install dependencies (optional)
pip install -r requirements.txt

# Make the script executable
chmod +x commit_with_date.py

# Create a symbolic link to make the script accessible globally
ln -s "$(pwd)/commit_with_date.py" /usr/local/bin/fpush

# Display installation success message
echo "Installation completed successfully."
echo "You can now use the 'commit_with_date' command to execute the script."
