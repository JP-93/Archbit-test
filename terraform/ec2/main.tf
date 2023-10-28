terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 4.16"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = var.aws_region
}




resource "aws_security_group" "all_access" {
  name = "allow-access-sg"
  vpc_id = "${var.vpc_id}"

  ingress {
    description      = "ssh"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}

resource "aws_key_pair" "access" {
  key_name = ""
  public_key = ""
}

resource "aws_instance" "archbit" {
  ami = "ami-0fc5d935ebf8bc3bc"
  instance_type = "t2.micro"
  key_name = "${var.key_pair_name}"
  vpc_security_group_ids = [ aws_security_group.all_access.id ]
  }