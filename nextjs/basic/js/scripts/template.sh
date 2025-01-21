#!/bin/bash

echo "Clearing existing files..."
rm -rf ./public/*
rm -rf ./src/*

echo "Downloading files from GitHub..."
git clone https://github.com/ChaosCantrip/Launchpad.git temp_repo

echo "Copying files..."
cp -r temp_repo/nextjs/basic/js/.gitignore ./.gitignore
cp -r temp_repo/nextjs/basic/js/src/* ./src/
cp -r temp_repo/nextjs/basic/js/public/* ./public/

echo "Removing temporary repository..."
rm -rf temp_repo

echo "Update complete!"