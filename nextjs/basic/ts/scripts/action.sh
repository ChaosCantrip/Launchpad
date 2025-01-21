#!/bin/bash

echo "Downloading files from GitHub..."
git clone https://github.com/ChaosCantrip/Launchpad.git temp_repo

echo "Making Folder..."
mkdir -p .github/workflows

echo "Copying GitHub action..."
cp temp_repo/nextjs/basic/ts/github_actions/build-and-push.yml ./.github/workflows/build-and-push.yml

echo "Removing temporary repository..."
rm -rf temp_repo

echo "Update complete!"