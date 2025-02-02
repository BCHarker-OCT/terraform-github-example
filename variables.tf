variable "repo_name" {
  description = "Name of the GitHub repository"
  type        = string
}

variable "first_file" {
  description = "Name of the initial file to add to the repository"
  type        = string
}

variable "github_token" {
  description = "Our GitHub PAT Token"
  type        = string
  sensitive   = true
}