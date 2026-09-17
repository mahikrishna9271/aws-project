resource "aws_instance" "my-ec2" {
  ami           = "ami-01a00762f46d584a1"
  instance_type = "t3.small"
  associate_public_ip_address = true
  security_groups = [aws_security_group.my-sg.name]

  user_data = <<-EOF
              #!/bin/bash
              apt-get update -y
              apt-get install -y nginx
              systemctl start nginx
              systemctl enable nginx
              echo "<h1>Welcome Gamini and Vihaan</h1>" > /var/www/html/index.html
              EOF
  
    tags = {
    "Name" = "MyEC2Instance-dev"
}
}

resource "aws_security_group" "my-sg" {
  name        = "my-security-group"
  description = "Allow HTTP and SSH traffic"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}