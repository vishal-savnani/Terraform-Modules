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

data "aws_ami" "image" {
    name_regex = "^al2023-ami-2023*"
    most_recent = true
    owners = ["amazon"]

    filter {
      name = "name"
      values = ["al2023-ami-2023*"]
    }
  
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
