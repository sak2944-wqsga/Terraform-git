resource "aws_instance" "dev" {
  ami           = var.ami-id
  instance_type = var.instance-type
  tags = {
    Name = "ec2-dev"
  }
}

resource "aws_instance" "test" {
  ami           = var.ami-id
  instance_type = var.instance-type-b
  tags = {
    Name = "ec2-test"
  }
}
