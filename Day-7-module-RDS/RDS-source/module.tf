# DB Subnet Group
resource "aws_db_subnet_group" "dev_db_subnet_group" {
  name       = "dev-db-subnet-group"
  subnet_ids = [
    "subnet-014eb798085279d2c",
    "subnet-05ac0f069880dea18"
  ]
  tags = {
    Name = "dev-db-subnet-group"
  }
}

# Security Group for RDS
resource "aws_security_group" "dev_rds_sg" {
  name   = "dev-rds-sg"
  vpc_id = "vpc-008cd6e1a7fb591f3"
  tags = {
    Name = "dev-rds-sg"
  }

  # Allow MySQL traffic from application SG
  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "TCP"
   
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# RDS MySQL Instance
resource "aws_db_instance" "dev_rds" {
  allocated_storage      = var.allocated_storage
  storage_type           = var.storage_type
  engine                 = var.engine
  engine_version         = var.engine_version
  instance_class         = var.instance_class
  db_name                = var.db_name
  identifier             = var.identifier
  username               = var.username
  password               = var.password
  skip_final_snapshot    = var.skip_final_snapshot
  publicly_accessible    = var.publicly_accessible
  backup_retention_period = var.backup_retention_period

  db_subnet_group_name = aws_db_subnet_group.dev_db_subnet_group.name
  vpc_security_group_ids = [ aws_security_group.dev_rds_sg.id ]
  depends_on = [ aws_db_subnet_group.dev_db_subnet_group ]

  tags = {
    Name = var.Name
  }
}
