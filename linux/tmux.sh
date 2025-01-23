#!/bin/bash

echo "Installing tmux..."
sudo apt update -y
sudo apt install tmux -y

echo "Removing old directories..."
rm -rf ~/.tmux
rm -rf ~/.config/tmux

echo "Making ~/.config/tmux directory..."
mkdir -p ~/.config/tmux

echo "Downloading TPM..."
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "Copying config..."
cp -r .config/tmux ~/.config/

echo "Done!"