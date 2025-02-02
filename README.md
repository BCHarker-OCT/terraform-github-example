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



