provider "aws" {
  region = "us-east-1"
  profile = "prod"  #use aws configure --profile prod and then provide access&secret keys,region,format (eg.json) This will allow us to configure multiple aws accounts as profiles to create resources in them from same terraform main.tf
}

provider "aws" {
  region = "us-west-2"
  alias = "dev"          #this will be used for calling this specific provider in any resource
#  profile = "prod"      #this will give error as prod profile already using us-east-1
}

resource "aws_vpc" "name" {
    cidr_block = "10.0.0.0/16"
    provider = aws.dev    #calling via alias=dev
  
}

resource "aws_s3_bucket" "name" {
    bucket = "tdcsgddhsvdsh"
  
}

#note we can use multi provider block if diff requiremnt and diff resource and diff regions