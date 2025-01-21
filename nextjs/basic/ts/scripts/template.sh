#!/bin/bash

echo "Clearing existing files..."
rm -rf ./public/*
rm -rf ./src/*

echo "Downloading files from GitHub..."
git clone https://github.com/ChaosCantrip/Launchpad.git temp_repo

echo "Copying files..."
cp -r temp_repo/nextjs/basic/ts/.gitignore ./.gitignore
cp -r temp_repo/nextjs/basic/ts/src/* ./src/

echo "Removing temporary repository..."
rm -rf temp_repo

echo "Update complete!"