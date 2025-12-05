packer {
  required_plugins {
    amazon = {
      version = ">= 1.2.8"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

variable "region" {
  type    = string
  default = "us-west-2"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

source "amazon-ebs" "ubuntu" {
  ami_name      = "ami-navidad-sin-drama-{{timestamp}}"
  instance_type = var.instance_type
  region        = var.region

  source_ami_filter {
    filters = {
      name                = "ubuntu/images/*ubuntu-jammy-22.04-amd64-server-*"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["099720109477"]
  }

  ssh_username = "ubuntu"

  tags = {
    Name        = "AMI Navidad Sin Drama"
    Project     = "HashiTalks Packer"
    Owner       = "francotel"
    Environment = "demo"
  }
}

build {
  name    = "build-ami-navidad"
  sources = ["source.amazon-ebs.ubuntu"]

  provisioner "shell" {
    script = "scripts/install.sh"
  }

  post-processor "manifest" {
    output = "manifest.json"
  }
}
