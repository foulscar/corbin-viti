data "aws_caller_identity" "current" {}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "${data.aws_caller_identity.current.account_id}-terraform-s3backend"
}

resource "aws_s3_bucket_policy" "terraform_state_policy" {
  bucket = aws_s3_bucket.terraform_state.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid       = "AllowTerraformStateList",
        Effect    = "Allow",
        Principal = {
          AWS = data.aws_caller_identity.current.arn
        },
        Action    = "s3:ListBucket",
        Resource  = aws_s3_bucket.terraform_state.arn
      },
      {
        Sid       = "AllowTerraformStateObjectAccess",
        Effect    = "Allow",
        Principal = {
          AWS = data.aws_caller_identity.current.arn
        },
        Action    = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:DeleteObject"
        ],
        Resource  = "${aws_s3_bucket.terraform_state.arn}/*"
      }
    ]
  })
}

resource "aws_dynamodb_table" "terraform_state_lock" {
  name           = "${data.aws_caller_identity.current.account_id}-terraform-lock"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name        = "TerraformStateLockTable"
    Environment = "Terraform"
  }
}

# Outputs to help validate creation
output "s3_bucket_name" {
  value = aws_s3_bucket.terraform_state.bucket
}

output "dynamodb_table_name" {
  value = aws_dynamodb_table.terraform_state_lock.name
}