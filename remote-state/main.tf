terraform {
  required_version = "1.1.7"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.8.0"
    }
  }

  backend "s3" {
    bucket         = "workshop-terraform-andre-wronscki-state" // Poe o nome do bucket que você criou
    key            = "global/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "workshop-terraform-andre-wronscki-state" // Poe o nome da tabela no DynamoDB que vocë criou
    profile        = "default"
  }
}

provider "aws" {
  profile = "default"
  region  = "us-east-1"
}