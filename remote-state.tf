resource "aws_ecr_repository" "ecr-repo" {
  name = var.repo_name
  image_scanning_configuration {
    scan_on_push = true
  }
  tags = {
    Env = "demo"
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




