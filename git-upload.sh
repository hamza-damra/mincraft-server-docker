#!/bin/bash

# Initialize git if not already initialized
if [ ! -d .git ]; then
    git init
fi

# Add the remote repository if not already added
if ! git remote | grep -q 'origin'; then
    git remote add origin https://github.com/hamza-damra/mincraft-server-docker.git
fi

# Optional: Use a GitHub token for authentication
# Uncomment and set your token below for non-interactive authentication
# GITHUB_TOKEN="your_token_here"
# git remote set-url origin https://$GITHUB_TOKEN@github.com/hamza-damra/mincraft-server-docker.git

# Add all files
git add .

# Commit changes
echo "Enter commit message:"
read commit_message
git commit -m "$commit_message"

# Push to GitHub
git push -u origin main

echo "Upload complete!"
