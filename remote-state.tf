terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "nogols"

    workspaces {
      name = "aplicacao-ci-cd"
    }
  }
}

credentials "app.terraform.io" {
  token = "eyk7IJnzFN5e7g.atlasv1.zAw54yTq8BGBE0GCIHAT4DrbP6FToQuuQDHzltGmInqpcZqg8KT3Hy2zEiWdr9JwzIo"
}