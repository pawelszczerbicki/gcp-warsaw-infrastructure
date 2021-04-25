locals {
  project_id = "warsaw-2"
}

remote_state {
  generate = {
    path = "state.tf"
    if_exists = "overwrite_terragrunt"
  }
  backend = "local"
  config = {
    path= "../state/uat/state.tfstate"
  }
}


terraform {
  extra_arguments "common_vars" {
    commands = ["plan", "apply", "destroy", "refresh"]
    arguments = [
     "-var-file=vars-uat.tfvars"
    ]
  }
}

generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
    provider "google" {
      project="${local.project_id}"
      region="us-central"
    }
    EOF
}
