locals {
  region = "us-east-1"
  instance_type = "t2.micro"
  
}
provider "aws" {
    region = local.region
  
}
resource "aws_instance" "name" {
    ami = "ami-08a6efd148b1f7504"
    instance_type = local.instance_type
  
}
# defining time use locals (plural) as we can define multiple parameters in it
# calling time use local  (singular) as we are calling single parameter in it