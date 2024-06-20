terraform {
    required_providers {
      aws = {
        source = "hashicorp/aws"
        version = "~>5.0"
      }
    }
}  

provider "aws" {
    profile = "default"
  
}

data "aws_ami" "aws_ami" {
  name_regex = "^amzn2-ami-kernel-5.10*"
  most_recent = true
  owners = ["amazon"]
  filter {
    name = "name"
    values = [ "amzn2-ami-kernel-5.10*" ]
  }
}
output "testing_ami" {
  value = data.aws_ami.linux_ami.id
}

resource "aws_instance" "demo-instance" {
    ami = data.aws_ami.image.id
    instance_type = "t2.micro"


}

output "ami-detail" {
  value = data.aws_ami.image.id
}

output "instace-details" {
  value = aws_instance.demo-instance.id
}
