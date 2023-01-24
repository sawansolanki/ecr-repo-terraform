variable "repo_name" {
  type = string
  default = "ecr-repo-sa1"
}

variable "bucket_name" {
  type = string
  default = "remote-sts-s3-sa1"
}

variable "dynamodb_table" {
  type = string
  default = "state-lock-db-table-sa1"
}
