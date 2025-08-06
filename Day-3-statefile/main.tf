
resource "aws_s3_bucket" "name" {                           #s3 bucket creation
    bucket = "shubhs-tfstate-bucket"
  
}
resource "aws_s3_bucket_versioning" "name" {                #bucket versioning enable
    bucket = "shubhs-tfstate-bucket"

    versioning_configuration {
      status = "Enabled"
    }

}

resource "aws_iam_role" "ec2_s3_role" {                    #iam role creation
    name = "ec2-s3-access-role"

    assume_role_policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
            { Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_policy_attachment" "name" {             #iam policy attach
    name = "s3-access"
    roles = [aws_iam_role.ec2_s3_role.name]
    policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}
resource "aws_iam_instance_profile" "ec2_profile" {       #iam instance profile used in instance creation block
    name = "aws-s3-instance-profile"
    role = aws_iam_role.ec2_s3_role.name
  
}
resource "aws_instance" "dev" {                             #ec2 instance creation
  ami           = "ami-08a6efd148b1f7504"
  instance_type = "t2.micro"
  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name
  tags = {
    Name = "ec2-dev-s3-access"
  }
}