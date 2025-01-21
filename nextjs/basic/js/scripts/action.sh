#!/bin/bash

echo "Downloading files from GitHub..."
git clone https://github.com/ChaosCantrip/Launchpad.git temp_repo

echo "Copying GitHub action..."
cp -r temp_repo/github_actions/build-and-push.yml ./.github/workflows/build-and-push.yml

echo "Removing temporary repository..."
rm -rf temp_repo

echo "Update complete!"