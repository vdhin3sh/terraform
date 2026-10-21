resource "aws_security_group" "global-sg-2026" {
  name = var.sgname
  description = "Allow HTTP HTTPS SSH"

  ingress {
    description = "ssh"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = var.cidr
  }

  ingress {
    description = "http"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = var.cidr
  }

  ingress {
    description = "https"
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = var.cidr
  }

  egress {
    from_port = 0
    to_port  = 0
    protocol = "-1"     #-1 means all traffic
    cidr_blocks = var.cidr
  }

  tags = {
    Name = var.sgname
  }
}