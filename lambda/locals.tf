locals {
  env = terraform.workspace == "default" ? "dev" : terraform.workspace
}