export GOOGLE_APPLICATION_CREDENTIALS=XXX/key-prod.json
export GOOGLE_APPLICATION_CREDENTIALS=XXX/key-uat.json

terragrunt apply --terragrunt-config terragrunt-prod.hcl
terragrunt apply --terragrunt-config terragrunt-uat.hcl
