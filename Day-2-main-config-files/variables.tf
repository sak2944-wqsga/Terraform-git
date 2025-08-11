variable "ami-id" {
    description = "inserting ami values to the main.tf file"
    type = string
    default = ""
  
}
variable "instance-type" {
    type = string
    default = "t2.nano" #the instance type will be t2.micro only even if t2.nano is given here coz t2.micro is given in terraform.tfvars file and it will replace the value in this variables.tf file coz tfvars file is at priority.
  
}
variable "instance-type-b" {
    type = string
    default = "t2.nano" #the instance type will be t2.micro only even if t2.nano is given here coz t2.micro is given in terraform.tfvars file and it will replace the value in this variables.tf file coz tfvars file is at priority.
  
}