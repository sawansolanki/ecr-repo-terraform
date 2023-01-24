
resource "aws_dynamodb_table" "tf_state_lock" {
  hash_key = "LockID"
  name     = var.dynamodb_table
  attribute {
    name = "LockID"
    type = "S"
  }
  billing_mode = "PAY_PER_REQUEST"
}

