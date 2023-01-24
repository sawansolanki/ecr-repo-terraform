resource "aws_ecr_repository" "ecr-repo" {
  name = var.repo_name

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Env = "demo"
  }

  
}
