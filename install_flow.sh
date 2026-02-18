#!/bin/bash

echo "===== System Update ====="
sudo apt update && sudo apt upgrade -y

sudo apt install ssh


################ npm Electron #################

echo "===== Installing NVM ====="
sudo apt install -y curl build-essential

curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

echo "===== Installing Node LTS ====="
nvm install --lts
nvm alias default 'lts/*'

echo "===== Checking Node & npm ====="
node -v
npm -v

echo "===== Updating npm ====="
npm install -g npm@latest



########################## TailScale ####################

echo "===== Installing Tailscale ====="

curl -fsSL https://tailscale.com/install.sh | sh

echo "===== Starting Tailscale ====="
sudo tailscale up

echo "===== Tailscale Status ====="
tailscale status

echo "===== Setup Complete ====="





