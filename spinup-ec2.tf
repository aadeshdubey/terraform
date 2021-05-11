terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "opsuser"
  region  = "ap-south-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-010aff33ed5991201"
  instance_type = "t2.micro"
  key_name      = "ec2"
  vpc_security_group_ids=["security-group-ec2"]
  tags = {
    Name = var.instance_name
  }
}
