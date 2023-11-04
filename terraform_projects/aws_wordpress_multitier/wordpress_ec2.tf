# Create a security group to allow web traffic
resource "aws_security_group" "allow_web" {
  name        = "allow_web_traffic"
  description = "Allow web inbound traffic"
  vpc_id      = "vpc-01021d1816a23b172"
  # Allow incoming HTTP from anywhere
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Allow_Web"
  }
}

# Associate the security group with the EC2 instance
resource "aws_instance" "wordpress_instance" {
  ami           = "ami-0e8a34246278c21e4"
  instance_type = "t2.micro"     # This is a free-tier eligible instance type
  user_data     = data.template_file.user_data.rendered
  subnet_id     = "subnet-026c82c6a8b95d448"
  # Associate the security group with this instance
  vpc_security_group_ids = [aws_security_group.allow_web.id]

  tags = {
    Name = "WordPressInstance"
  }
}

# Output the public IP address of the instance
output "wordpress_instance_public_ip" {
  value = aws_instance.wordpress_instance.public_ip
}
