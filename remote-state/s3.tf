resource "aws_s3_bucket" "this" {
  bucket = "workshop-terraform-andre-wronscki-state" // crie um outro bucket

  object_lock_enabled = true

  tags = {
    Name = "S3 Remote Terraform State Store"
  }
}

resource "aws_s3_bucket_versioning" "this" {
  bucket = aws_s3_bucket.this.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "this" {
  bucket = aws_s3_bucket.this.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_object_lock_configuration" "this" {
  bucket = aws_s3_bucket.this.bucket

  rule {
    default_retention {
      mode = "COMPLIANCE"
      days = 5
    }
  }
}