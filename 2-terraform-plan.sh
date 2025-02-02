#!/usr/bin/env bash

# Enable debugging mode to print each command before execution
set -x

# The below permits direnv to sideload environment variables.
direnv allow .

# This is just to make sure we're still in our dev workspace
terraform workspace list 

sleep 10 

# Finally we'll run a plan to see what changes will happen
terraform plan -var-file="./environments/dev-vars.tfvars"

# Disable debugging mode if no further commands need to be printed
set +x
