locals {
  nodejs_template_path = "../templates/lambdas/nodejs"
  output_path = "../files"

  common_tags = {
	  Project = "Workshop"
	  CreatedAt = timestamp()
	  ManagedBy = "Terraform"
  }
}