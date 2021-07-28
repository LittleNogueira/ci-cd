terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "nogols"

    workspaces {
      name = "aplicacao-ci-cd"
    }
  }
}
