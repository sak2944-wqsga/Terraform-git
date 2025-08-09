resource "aws_vpc" "name" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "dev-vpc"
    }
    depends_on = [ aws_s3_bucket.name ]  # explicity --> after creating s3 only vpc will create like depdnecy block usage 
}

  resource "aws_s3_bucket" "name" {
  bucket = "xyzdfjdjssde"
 }