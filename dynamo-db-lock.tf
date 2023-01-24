resource "aws_dynamodb_table" "tf_state_lock" {
  name           = var.dynamodb_table
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "LockID"
}

terraform {
  backend "s3" {
    bucket = "remote-sts-s3-sa1"
    key    = "state-file"
    region = "us-east-1"
  }
}
