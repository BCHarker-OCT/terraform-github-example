#!/usr/bin/env bash

# Enable debugging mode to print each command before execution
set -x

# This is just to make sure we're still in our dev workspace
terraform workspace ls 

# Finally we'll run a plan to see what changes will happen
terraform plan -var-file="z-dev-vars.tfvars"

# Disable debugging mode if no further commands need to be printed
set +x
