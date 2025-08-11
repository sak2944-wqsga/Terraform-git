ami-id = "ami-08a6efd148b1f7504"
instance-type = "t2.micro"
instance-type-b = "t2.micro"

#if we use other name than terraform.tfvars file then we should mention this in terraform apply -var-file="name.tfvars" command
#also multiple tfvars files can be created so we can use required one of them in this command for apply