resource "aws_ecr_repository" "ecr-repo" {
  name = var.repo_name

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Environment = "production"
  }

  lifecycle_policy {
    rule {
      rule_priority = 1
      action {
        type = "expire"
      }
      condition {
        days_since_image_pushed = 7
      }
    }
  }
}
