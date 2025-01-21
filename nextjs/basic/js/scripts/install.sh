#!/bin/bash

echo "Clearing existing files..."
rm -rf ./public/*
rm -rf ./src/*

echo "Downloading files from GitHub..."
git clone https://github.com/ChaosCantrip/Launchpad.git temp_repo

echo "Copying files..."
cp -r temp_repo/nextjs/basic/js/.gitignore ./.gitignore
cp -r temp_repo/nextjs/basic/js/src/* ./src/

echo "Dockerise? (y/n)"
read -r answer

if [[ $answer =~ ^[Yy]$ ]]; then
  echo "Copying Dockerfile..."
  cp temp_repo/Dockerfile .
  echo "Changing output to standalone..."
  cp temp_repo/nextjs/basic/js/next.config.js ./next.config.js
fi

echo "Add github action? (y/n)"
read -r answer

if [[ $answer =~ ^[Yy]$ ]]; then
  echo "What is the name of the Docker image? "
  read -r image_name
  echo "Copying GitHub action..."
  cp -r temp_repo/github_actions/build-and-push.yml ./.github/workflows/build-and-push.yml
  echo "Replacing image name..."
  sed -i "s#<IMAGE_NAME>#$image_name#g" ./.github/workflows/build-and-push.yml
fi

echo "Removing temporary repository..."
rm -rf temp_repo

echo "Update complete!"