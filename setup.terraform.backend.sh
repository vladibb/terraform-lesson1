#!/bin/sh
echo refreshing backend config for terraform

# dynamic variables file
cat <<EOV > terraform.tfvars
aws_owner   = "${AWS_ENVIRONMENT_NAME}"
aws_profile = "${AWS_ENVIRONMENT_PREFIX}"
EOV

# dynamic backend
cat <<EOT > backend.tf
terraform {
  backend "s3" {
    bucket         = "${AWS_ENVIRONMENT_NAME}-terraform-state"
    key            = "${AWS_ENVIRONMENT_NAME}"
    region         = "eu-west-1"
    encrypt        = "true"
    dynamodb_table = "${AWS_ENVIRONMENT_NAME}-terraform-state"
  }
}
EOT


