terraform {
  backend "remote" {
    organization = "nogols"

    workspaces {
      name = "aplicacao-ci-cd"
    }
  }
}

provider "aws" {
  version = "~> 3.0"
  region  = "us-east-1"
}

resource "aws_instance" "application-ci-cd" {
  ami           = "ami-0747bdcabd34c712a"
  instance_type = "t2.micro"
  key_name      = "gitlab-ssh"

  tags = {
    Name = "application-ci-cd"
  }
}

output "instance_ip" {
  value = aws_instance.application-ci-cd.public_ip
}