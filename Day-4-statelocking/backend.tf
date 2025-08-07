terraform {
  backend "s3" {
    bucket = "shubhs-tfstate-bucket"
    key    = "Day-4/terraform.tfstate"              #path of tfstate file
    region = "us-east-1"
    use_lockfile = true #s3 supports this feature but terraform version should be >1.10
  }
}

#this file will be used for pushing tfstate file to s3 bucket