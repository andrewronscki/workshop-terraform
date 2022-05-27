resource "aws_s3_bucket" "this" {
  bucket = "teste-workshop-lambda-trigger-${var.env}"
}

resource "aws_s3_bucket_notification" "this" {
  bucket = aws_s3_bucket.this.id

  lambda_function {
    lambda_function_arn = aws_lambda_function.this.arn
    events              = ["s3:ObjectCreated:*"]
    filter_prefix       = "teste/"
  }
}