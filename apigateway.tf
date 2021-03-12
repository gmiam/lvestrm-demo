resource "aws_apigatewayv2_api" "livestorm" {
  name          = "${var.name}-API"
  protocol_type = "HTTP"
  route_key     = "$default"
  target        = module.lambda_function.arn
}

resource "aws_apigatewayv2_integration" "livestorm" {
  api_id                    = aws_apigatewayv2_api.livestorm.id
  integration_type          = "AWS_PROXY"
  integration_method        = "POST"
  integration_uri           = module.lambda_function.invoke_arn
}

resource "aws_apigatewayv2_deployment" "livestorm" {
  depends_on = [
    aws_apigatewayv2_integration.livestorm,
  ]
  api_id     = aws_apigatewayv2_api.livestorm.id

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_lambda_permission" "apigw" {
	action        = "lambda:InvokeFunction"
        function_name = module.lambda_function.function_name
	principal     = "apigateway.amazonaws.com"
	source_arn    = "${aws_apigatewayv2_api.livestorm.execution_arn}/*/*"
}

output "base_url" {
  value = aws_apigatewayv2_api.livestorm.api_endpoint
}
