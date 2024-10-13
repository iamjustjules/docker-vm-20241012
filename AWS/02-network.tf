resource "aws_vpc" "docker_vpc" {
  cidr_block = var.docker_network.cidr
}

resource "aws_subnet" "docker_subnet" {
  vpc_id            = aws_vpc.docker_vpc.id
  cidr_block        = var.docker_network.cidr
  availability_zone = "${var.setup.region}a"
}

resource "aws_security_group" "docker_firewall" {
  name        = var.docker_network.firewall_name
  description = "Allow HTTP and SSH traffic"
  vpc_id      = aws_vpc.docker_vpc.id

  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
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
