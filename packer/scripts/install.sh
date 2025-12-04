#!/usr/bin/env bash
set -e

sudo apt-get update
sudo apt-get install -y nginx

echo "<h1>🎄 Feliz Navidad desde HashiTalks Perú! 🎄</h1>" | sudo tee /var/www/html/index.html
sudo systemctl enable nginx