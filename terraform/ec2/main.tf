terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = var.aws_region
}

resource "aws_security_group" "all_access" {
  name   = "allow-access-sg"
  vpc_id = var.vpc_id

  ingress {
    description = "ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "redis"
    from_port   = 6379
    to_port     = 6379
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


data "local_file" "public_ssh_key" {
  filename = var.path_pub_key
}


resource "aws_instance" "archbit" {
  ami                    = "ami-0fc5d935ebf8bc3bc"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.all_access.id]

  user_data = <<-EOF
    #!/bin/bash
    sudo -u ubuntu bash -c 'echo "${data.local_file.public_ssh_key.content}" >> ~/.ssh/authorized_keys'
    EOF

  tags = {
    name = "archbit-ec2"
  }
}