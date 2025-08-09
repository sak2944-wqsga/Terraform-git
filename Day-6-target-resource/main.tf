resource "aws_s3_bucket" "name" {
    bucket = "testingstatefilexyzpqr"
  
}

resource "aws_instance" "name" {
  ami           = "ami-08a6efd148b1f7504"
  instance_type = "t2.micro"
}

#now if we use terraform apply --target=aws_s3_bucket.name then it will create s3 bucket only & not ec2 instance