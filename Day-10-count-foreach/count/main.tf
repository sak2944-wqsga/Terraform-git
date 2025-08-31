resource "aws_instance" "name" {
    ami = "ami-08a6efd148b1f7504"
    instance_type = "t2.micro"
    count = length(var.ec2)
    tags = {
      Name = var.ec2[count.index]
    }
  
}

variable "ec2" {
    type = list(string)
    default = [ "dev", "test", "prod"]
  
}
#if we delete test(middle) server then it will not delete the actual test, it will delete prod(last) & rename test(middle) as prod