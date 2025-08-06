terraform {
  backend "s3" {
    bucket = "shubhs-tfstate-bucket"
    key    = "terraform.tfstate"              #path of tfstate file
    region = "us-east-1"
  }
}

#this file will be used for pushing tfstate file to s3 bucket