#!/usr/bin/env bash

# Enable debugging mode to print each command before execution
set -x

# The terraform init command is the initial step in the Terraform workflow,
# responsible for setting up the working directory containing your configuration files.
# Mainly it sets up providers, modules, and backends.
terraform init

# The below permits direnv to sideload environment variables.
direnv allow .

# Create 2 terraform workspaces: one for dev and one for prod
terraform workspace new dev
terraform workspace new prod

# We will deploy to dev in this situation, so this is how we select the environment.
terraform workspace select dev

# Disable debugging mode if no further commands need to be printed
set +x
