This is a minimal working example of a terraform project creating a lambda (using rust sdk) and an api gateway endpoint to be able to trigger the lambda.

# lvestrm-demo

- Only variables available are the aws region in main.tf and the lambda name in variables.tf
- rust.zip file is mandatory. It should contain the rust binary (named bootstrap)
- You need an active connection to an AWS account to use terraform commands
- terraform apply is everything you need to have this example up and running
