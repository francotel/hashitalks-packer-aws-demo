#!/usr/bin/env bash
set -e

sudo apt-get update
sudo apt-get install -y nginx

cat << 'EOF' | sudo tee /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
  <title>HashiTalks Peru</title>
</head>
<body>
  <h1>*** Welcome to HashiTalks Peru ***</h1>
  <p>This AMI was created with Packer.</p>
  <p>Build time: $(date)</p>
</body>
</html>
EOF

sudo systemctl enable nginx