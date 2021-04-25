locals {
  project_id = "warsaw"
}

remote_state {
  generate =  {
    path = "state.tf"
    if_exists = "overwrite_terragrunt"
  }
  backend = "local"
  config = {
    path= "../state/prod/state.tfstate"
  }
}


terraform {
  extra_arguments "common_vars" {
    commands = ["plan", "apply", "destroy", "refresh"]
    arguments = [
      "-var-file=vars-prod.tfvars"
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
