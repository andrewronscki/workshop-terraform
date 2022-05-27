terraform {
  required_version = "1.1.7"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.8.0"
    }
  }

  backend "s3" {
    bucket         = "workshop-terraform-andre-wronscki-state" // Poe o nome do bucket do remote-state que você criou
    key            = "teste-lambda/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "workshop-terraform-andre-wronscki-state" // Poe o nome da tabela do DynamoDB do remote-state que você criou
    profile        = "default"
  }
}

provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

module "lambda" {
  source = "./teste-lambda"
  env    = local.env
}