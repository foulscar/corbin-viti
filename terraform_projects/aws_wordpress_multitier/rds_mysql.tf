variable "database_name" {
  description = "The name of the database for the RDS instance."
  type        = string
}

variable "database_user" {
  description = "The username for the RDS database."
  type        = string
}

variable "database_password" {
  description = "The password for the RDS database user."
  type        = string
  sensitive   = true
}

resource "aws_db_subnet_group" "wordpress_subnet_group" {
  name       = "wordpress-db-subnet-group"
  subnet_ids = ["subnet-0bbccaa5aabf7cf0f","subnet-0992ae8ffa4633c21"]

  tags = {
    Name = "WordPressDBSubnetGroup"
  }
}

# Define an RDS instance for WordPress
resource "aws_db_instance" "wordpressdb" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7" # Use the MySQL version compatible with your WordPress
  instance_class       = "db.t2.micro"
  db_name              = var.database_name
  username             = var.database_user
  password             = var.database_password
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  # Security group to associate with RDS for allowing traffic from EC2 instance security group
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.wordpress_subnet_group.name

  tags = {
    Name = "WordPressDBInstance"
  }
}

# Security group for the RDS instance
resource "aws_security_group" "rds_sg" {
  name        = "rds_sg"
  description = "Allow traffic from EC2 instance security group to RDS"
  vpc_id      = "vpc-01021d1816a23b172"
  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.allow_web.id]
  }

  tags = {
    Name = "Allow_RDS_WordPress"
  }
}