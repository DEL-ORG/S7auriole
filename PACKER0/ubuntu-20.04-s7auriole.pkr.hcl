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
# source = now the builder phase: we need to provide the name of the builder:click on Integrations and pick amazon you will see the required and optional here is amazon-ebs 
#"ubuntu" is the name of the builder, you can give any name
#ami_name = "the name of the image;give any name"
#instance_type = "the type of instance"
#source_ami_filter:
#name = we need to get the specific id of the image we want to use. Go to the amazon ec2 click lunch ec2 instance then search ubuntu and copy the id with ami
#ssh_username = here the default username is ubuntu. If it is another image make sure to search for the default username
#build:
#  name = any name you want to give to the build prefer the same name as ami_name
# sources = here we are providing the name of the builder we created in the previous step line 20 write exactly the same but separate with . "source.amazon-ebs.ubuntu"
# if you have many source you can write like this "source.amazon-ebs.ubuntu, source.azure-ebs.ubuntu"
#owners = Specifies the AWS account ID of the AMI owner (in this case, the official Ubuntu account)
# Provisioner:this where we are using shell provisioner to run the script, 
# inline = list of commands to run
# post-processor: this is where we are using vagrant post-processor to create the vagrant box
# post-processors = compress the vagrant box
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
#if you want to use the another source for another builders you start here and put from line 22 to line 36 here for that different source.
build {
  name = "ubuntu-20.04-s7auriole"
  sources = [
    "source.amazon-ebs.ubuntu"
  ]
  provisioner "shell" {
    inline = [
      "sudo apt-get update -y",
      "sudo apt-get install git -y",
    ]

  }
  post-processor "vagrant" {}
  post-processor "compress" {}
}
