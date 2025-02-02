# terraform-github-example
A template repository to be used for GitHub Terraform Repo Creation.

## Step 1 Setup the GitHub Provider

Setup the [Github Provider](https://registry.terraform.io/providers/integrations/github/latest/docs) in our `providers.tf` file. 

We can copy the code directly with the "Use Provider" button on the top right of the page. 

## Step 2 Setup .envrc file 

Copy the .envrc.example file to a file name .envrc. 
In your GitHub account go to Setting > Developer Settings > Personal access tokens > Tokens classic

Generate a new token using the classic option. 

Grant it full rights to the `repo` and `delete_repo` permissions. 

Copy the value into the new `.envrc` file that you've created. 

## Step 3 Setup Variables 

Although variables tend to be more dynamic when working a project and you might decide to turn a value into a variable later on when working on a project we will assume that we need two variable values for this project, which are: 

- `repo_name`
- `first_file`  

[Documentation is here](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/aws-variables)

We have one additional variable, which is the GitHub token. However, this variable will _never_ be listed in a publicly committed file, even if our respository is private we should assume that this secret is too vulnerable to be exposed. We can store it locally or within a GitHub environment variable if we deploy our Terraform via Github actions. 

We should also be aware that some secrets may be stored in our `terraform.tfstate` file, so we should consider this file as containing sensitive information. For this reason, it is excluded from our commits in the `.gitignore` file. 

## Setup 4 Setup Resources 





