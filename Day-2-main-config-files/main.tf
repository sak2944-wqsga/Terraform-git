resource "aws_instance" "dev" {
  ami           = var.ami-id
  instance_type = var.instance-type
}

resource "aws_instance" "test" {
  ami           = var.ami-id
  instance_type = var.instance-type
}
