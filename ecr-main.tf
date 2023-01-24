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
