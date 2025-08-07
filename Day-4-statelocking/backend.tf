terraform {
  backend "s3" {
    bucket = "shubhs-tfstate-bucket"
    key    = "Day-4/terraform.tfstate"              #path of tfstate file
    region = "us-east-1"
    #use_lockfile = true #s3 supports this feature but terraform version should be >1.10
    dynamodb_table = "statelock" #this method can be used with any version (older than 1.10)
    encrypt = true
  }
}

#this file will be used for pushing tfstate file to s3 bucket
#the lockfile will apply lock to the statefile when terraform apply command is run, this lock will not allow other requests at the same time (other developers-dev2)