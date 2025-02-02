# terraform-github-example
A template repository to be used for GitHub Terraform Repo Creation.

## Step 1: Setup `.envrc` file 

1. Copy the `.envrc.example` file to a file named `.envrc`. 
2. In your GitHub account go to Setting > Developer Settings > Personal access tokens > Tokens classic
3. Generate a new token using the classic option. Set the expiration as the shortest possible value.
4. Grant it full rights to the `repo` and `delete_repo` permissions. 
5. Copy the value into the new `.envrc` file that you've created. 

## Step 2: Setup the GitHub Provider

Setup the [Github Provider](https://registry.terraform.io/providers/integrations/github/latest/docs) in our `providers.tf` file. 

We can copy the code directly with the "Use Provider" button on the top right of the page. 

```terraform
terraform {
  required_providers {
    github = {
      source = "integrations/github"
      version = "6.5.0"
    }
  }
}

provider "github" {
  # Configuration options
  token = vars.github_token
}
```

## Step 4: Setup Variables 

Like any programming language variables allow us to define repetitive values quickly. They also give us flexibility to change out values between environments (dev,qa,prod):

- `repo_name`
- `first_file`  
- `github_token` 

For example: 

```terraform
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
```

[Variables](https://developer.hashicorp.com/terraform/language/values/variables)

## Setup 5: Setup Resources 

Finally, we should investigate resources we can setup in our respository that Terraform will make for us. 

To make it simple we want Terraform to provision us a Github repository and to add a file to it, so we can standardize our process. 

Let's use the following resources: 

- [github_repository](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository)
- [github_repository_file](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_file)

Example: 
```terraform
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
```

## Step 5: Running the Terraform! 
> [!CAUTION]
Terraform may store secrets in `terraform.tfstate`. For this reason, it is excluded from our commits in the `.gitignore` file. 

- [Terraform Init](https://developer.hashicorp.com/terraform/cli/commands/init)
- Let's also run `direnv allow .` to sideload our environment variable containing our GitHub PAT so that our Terraform will have permission to do what it needs. 
- [Terraform Workspace](https://developer.hashicorp.com/terraform/cli/commands/workspace)
- [Terraform Plan](https://developer.hashicorp.com/terraform/cli/commands/plan)
- [Terraform Apply](https://developer.hashicorp.com/terraform/cli/commands/apply)
- [Terraform State](https://developer.hashicorp.com/terraform/cli/commands/state)
- [🌋Terraform Destory](https://developer.hashicorp.com/terraform/cli/commands/destory)
