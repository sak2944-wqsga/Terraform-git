module "RDS" {
    source = "./RDS-source"
    allocated_storage      = 20
    storage_type           = "gp2"
    engine                 = "mysql"
    engine_version         = "8.0"
    instance_class         = "db.t3.micro"
    db_name                = "devdb"
    identifier             = "my-dev-db"
    username               = "admin"
    password               = "StrongPassw0rd!"
    skip_final_snapshot    = true
    publicly_accessible    = true
    backup_retention_period = 7
    Name = "main-rds"

}