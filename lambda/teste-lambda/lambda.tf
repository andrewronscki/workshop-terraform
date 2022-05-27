data "archive_file" "this" {
  type = "zip"
  source_file = "${local.nodejs_template_path}/index.js"
  output_path = "${local.output_path}/teste-lambda.zip"
}

resource "aws_lambda_function" "this" {
  function_name = "test-lambda"
  handler = "index.handler"
  runtime = "nodejs14.x"
  role = aws_iam_role.this.arn

  filename = data.archive_file.this.output_path

  tags = local.common_tags

  environment {
	variables = {
	  "TESTE" = "WORKSHOP ANDRÉ"
	}
  }
}

resource "aws_lambda_permission" "this" {
  statement_id = "AllowExecutionFromS3Bucket"
  action = "lambda:InvokeFunction"
  function_name = aws_lambda_function.this.arn
  principal = "s3.amazonaws.com"
  source_arn = aws_s3_bucket.this.arn
}