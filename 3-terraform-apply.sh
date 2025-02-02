#!/usr/bin/env bash

# Enable debugging mode to print each command before execution
set -x

# Finally we'll run a plan to see what changes will happen
terraform apply -var-file="./environments/dev-vars.tfvars"

# Disable debugging mode if no further commands need to be printed
set +x
