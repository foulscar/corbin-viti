terraform {
  backend "s3" {
    bucket         = "143401347263-terraform-s3backend"
    key            = "state/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "143401347263-terraform-lock"
    encrypt        = true
  }
}