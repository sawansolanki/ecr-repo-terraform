resource "aws_dynamodb_table" "tf_state_lock" {
  name           = var.dynamodb_table
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "LockID"
}

terraform {
  backend "s3" {
    bucket = var.bucket_name
    key    = "state-file"
    region = "us-east-1"
  }
}
