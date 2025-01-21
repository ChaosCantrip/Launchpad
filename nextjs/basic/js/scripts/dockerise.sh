#!/bin/bash

echo "Downloading files from GitHub..."
git clone https://github.com/ChaosCantrip/Launchpad.git temp_repo

echo "Copying Dockerfile..."
cp temp_repo/nextjs/basic/js/Dockerfile .
echo "Changing output to standalone..."
cp temp_repo/nextjs/basic/js/next.config.mjs ./next.config.mjs

echo "Removing temporary repository..."
rm -rf temp_repo

echo "Update complete!"