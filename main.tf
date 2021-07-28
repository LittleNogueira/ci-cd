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
  ami           = "ami-0c2b8ca1dad447f8a"
  instance_type = "t2.micro"

  tags = {
    Name = "application-ci-cd"
  }
}
