resource "github_repository" "example" {
  name        = var.repo_name
  description = "A repository created by Terraform"
  visibility  = "private"
}

resource "github_repository_file" "example_file" {
  repository = github_repository.example.name
  file       = var.first_file
  content    = "Initial content"
}