terraform {
  backend "remote" {
    organization = "nogols"

    workspaces {
      name = "aplicacao-ci-cd"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "gitlab-security-group" {
  name        = "gitlab-security-group"

  ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "gitlab-security-group"
  }
}

resource "aws_instance" "application-ci-cd" {
  ami           = "ami-0747bdcabd34c712a"
  instance_type = "t2.micro"
  key_name      = "gitlab-ssh"
  security_groups = ["${aws_security_group.gitlab-security-group.name}"]

  tags = {
    Name = "application-ci-cd"
  }

}

output "instance_ip" {
  value = aws_instance.application-ci-cd.public_ip
}
