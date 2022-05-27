variable "aws_region" {
  description = "AWS region where the resources will be created"

  type = object({
    dev  = string
    prod = string
  })

  default = {
    dev  = "us-east-1"
    prod = "us-east-2"
  }
}

variable "aws_profile" {
  type    = string
  default = "default"
}
