#!/bin/bash

echo "Installing OMP..."
export PATH=$PATH:~/.local/bin
curl -s https://ohmyposh.dev/install.sh | bash -s

echo "Installing Font..."
oh-my-posh font install JetBrainsMono

echo "Removing old directory..."
rm -rf ~/.config/omp

echo "Making ~/.config/omp directory..."
mkdir -p ~/.config/omp

echo "Copying config..."
cp -r .config/omp ~/.config/

if ! grep -q "oh-my-posh" ~/.bashrc; then
    echo "Adding OMP to ~/.bashrc..."
    echo 'eval "$(oh-my-posh init bash --config ~/.config/omp/theme.omp.json)"' >> ~/.bashrc
else
    echo "OMP already in ~/.bashrc"
fi

exec bash

echo "Done!"