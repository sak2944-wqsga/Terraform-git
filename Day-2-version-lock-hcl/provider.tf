#provider "aws" {
# 
#}
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.5.0" #if you want to change the version, change it here & run terraform init -upgrade command so that lock will release to allow download specified version.
    }
  }
}

provider "aws" {
  # Configuration options
}