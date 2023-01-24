provider "aws" {
  region = "us-west-2"
}

terraform {
  backend "s3" {
    bucket = "remote-sts-s3-sa1"
    key    = "state-file"
    region = "us-east-1"
  }
}

resource "aws_ecr_repository" "ecr-repo" {
  name = var.repo_name
  image_scanning_configuration {
    scan_on_push = true
  }
  tags = {
    Env = "demo"
  }
}

resource "aws_ecr_repository_policy" "ecr-reop-policy" {
  repository = aws_ecr_repository.ecr-repo.name

  policy = <<EOF
{
  "Version": "2008-10-17",
  "Statement": [
    {
      "Sid": "AllowPushPull",
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::344404329696:root"
      },
      "Action": [
        "ecr:GetDownloadUrlForLayer",
        "ecr:BatchGetImage",
        "ecr:BatchCheckLayerAvailability",
        "ecr:PutImage",
        "ecr:InitiateLayerUpload",
        "ecr:UploadLayerPart",
        "ecr:CompleteLayerUpload"
      ]
    }
  ]
}
EOF
}

resource "aws_s3_bucket" "tf_state" {
  bucket = var.bucket_name
  acl    = "private"
  versioning {
    enabled = true
  }
}
