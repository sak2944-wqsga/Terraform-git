resource "aws_instance" "name" {
  ami           = "ami-08a6efd148b1f7504"
  instance_type = "t2.micro"
  lifecycle {
    prevent_destroy = false    #this will not allow terraform destroy command to delete this resource ie aws instance
    create_before_destroy = true #this will create new resource before destroying the existing older one
    ignore_changes = [ tags, ami ]  #this will not allow to change the data mentioned in the list bracket
  }
}
#the lifecycle rule is mentioned in resource block so it will apply to that resource block only