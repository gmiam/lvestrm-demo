module "lambda_function" {
  source = "github.com/raymondbutcher/terraform-aws-lambda-builder"

  # Standard aws_lambda_function attributes.
  create_role   = true
  function_name = var.name
  handler       = "hello.handler"
  runtime       = "provided.al2"
  filename      = "rust.zip"
  timeout       = 30


  # Create and use a role with CloudWatch Logs permissions.
  role_cloudwatch_logs = true
}
