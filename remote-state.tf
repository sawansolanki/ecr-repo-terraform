resource "aws_s3_bucket" "tf_state" {
  bucket = var.bucket_name
  acl    = "private"
  versioning {
    enabled = true
  }
}

resource "aws_s3_bucket_policy" "tf_state" {
  bucket = aws_s3_bucket.tf_state.id

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::256537223841:root"
      },
      "Action": [
        "s3:GetObject",
        "s3:PutObject"
      ],
      "Resource": [
        "arn:aws:s3:::{var.bucket_name}/state-file"
      ]
    }
  ]
}
EOF
}

terraform {
  backend "s3" {
    bucket = "remote-sts-s3-sa1"
    key    = "state-file"
    region = "us-east-1"
  }
}


