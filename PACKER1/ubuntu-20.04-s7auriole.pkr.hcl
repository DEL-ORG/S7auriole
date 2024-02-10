packer {
  # require plugins go to packer documantion to check and click on plugins and pick amazon if you are using amazon
  required_plugins {
    amazon = {
      version = ">= 1.2.8"
      source  = "github.com/hashicorp/amazon"
    }
    vagrant = {
      version = "~> 1"
      source  = "github.com/hashicorp/vagrant"
    }
  }
}
source "amazon-ebs" "ubuntu" {
  ami_name      = "ubuntu-20.04-s7auriole"
  instance_type = "t2.micro"
  region        = "us-east-1"
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
}
build {
  name = "ubuntu-20.04-s7auriole"
  sources = [
    "source.amazon-ebs.ubuntu"
  ]
  provisioner "shell" {
    script = "./app.sh"

  }
  post-processor "vagrant" {}
  post-processor "compress" {}
}
