#!/bin/bash

# CONFIG
REPO_URL="https://github.com/Web4application/Spoon-Knife.git"
FOLDER="web4-playground"
BRANCH="main"

# Check if folder exists
if [ ! -d "$FOLDER" ]; then
  echo "Error: Folder '$FOLDER' not found!"
  exit 1
fi

cd $FOLDER

# Initialize git if not already
if [ ! -d ".git" ]; then
  git init
  echo "Git initialized."
fi

# Add remote if not exists
if ! git remote | grep -q origin; then
  git remote add origin $REPO_URL
  echo "Remote 'origin' added."
fi

# Add all files
git add .

# Commit
git commit -m "Deploy: Web4 Playground template files" || echo "Nothing to commit."

# Set branch
git branch -M $BRANCH

# Push to GitHub
git push -u origin $BRANCH --force

echo "Deployment complete! ✅"
