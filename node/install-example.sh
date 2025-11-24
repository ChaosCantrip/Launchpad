#!/bin/bash
set -e

REPO="https://github.com/ChaosCantrip/Launchpad.git"
TMP_DIR="temp-launchpad"

# Clone repo shallowly
git clone --depth=1 $REPO $TMP_DIR

# Copy only the node/example folder into current working directory
cp -r $TMP_DIR/node/example/* .
cp $TMP_DIR/node/example/.gitignore .gitignore

# Clean up
rm -rf $TMP_DIR

# Install dependencies
npm install

# Initialise git repo
git init
git add .
git commit -m "Initial Commit from ChaosCantrip/Launchpad/node/install-example.sh"

echo "✅ Project files installed in $(pwd)"
echo "Run dev mode with: npm run dev"