terraform {
  source = "git::https://github.com/kbrownebcit/terraform-demo-repo.git"
}
remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket  = "tf-demo-bucket-kyle"
    key     = "terraform.tfstate"
    region  = "us-west-2"
    encrypt = true
  }
}
inputs = {
  deploy_region = "us-west-2"
  access_key    = "<KEY>"
  secret_key    = "<SECRET>"
}

