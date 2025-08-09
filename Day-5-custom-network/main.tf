# Create VPC
resource "aws_vpc" "name" {
  cidr_block       = "10.0.0.0/16"
  tags = {
    Name = "auto-vpc"
  }
}
# Create Subnet
resource "aws_subnet" "name" {
    vpc_id = aws_vpc.name.id
    cidr_block = "10.0.0.0/24"
    tags = {
      Name = "auto-subnet"
    }
}
# Create IGW & attach to VPC
resource "aws_internet_gateway" "name" {
    vpc_id = aws_vpc.name.id
    tags = {
      Name = "auto-igw"
    }
}
# Create RT & edit Routes
resource "aws_route_table" "name" {
    vpc_id = aws_vpc.name.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.name.id
    }
    tags = {
      Name = "auto-rt"
    }
  
}
# Create subnet association
resource "aws_route_table_association" "name" {
    subnet_id = aws_subnet.name.id
    route_table_id = aws_route_table.name.id
}
# Create Security Groups
resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  vpc_id      = aws_vpc.name.id
  tags = {
    Name = "auto-sg"
  }
 ingress {                                          #ingress means inbound & egress means outbound rule
    description      = "TLS from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }
ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }
ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
}
egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1" #all protocols 
    cidr_blocks      = ["0.0.0.0/0"]
    
  }
}

# Create Servers
resource "aws_instance" "dev" {
  ami           = var.ami-id
  instance_type = var.instance-type
  subnet_id = aws_subnet.name.id
  vpc_security_group_ids = [ aws_security_group.allow_tls.id ]
  tags = {
    Name = "ec2-auto"
  }
}

# Create private network
# Create Elastic IP
resource "aws_eip" "name" {
  domain = "vpc"
  tags = {
    Name = "auto-pvt-eip"
  }
}
# Create NAT Gateway
resource "aws_nat_gateway" "name" {
  allocation_id = aws_eip.name.id
  subnet_id = aws_subnet.name.id
  tags = {
    Name = "auto-natgw"
  }
  
}
# Create pvt Route Table for NAT GW
resource "aws_route_table" "pvt-rt" {
  vpc_id = aws_vpc.name.id
  route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_nat_gateway.name.id
    }
    tags = {
      Name = "auto-pvt-rt"
    }
  
}