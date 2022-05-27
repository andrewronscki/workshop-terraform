resource "aws_dynamodb_table" "this" {
  name           = "workshop-terraform-andre-wronscki-state" // crie uma outra tabela no DynamoDB
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    "Project" = "Workshop"
    "Name"    = "DynamoDB Terraform State Lock Table"
  }
}