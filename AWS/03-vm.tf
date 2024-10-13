resource "aws_instance" "docker_instance" {
  ami           = "ami-04250a5dceb67b437"  # amazon-eks-arm64-node-1.24-v20240807. EKS Kubernetes Worker AMI with AmazonLinux2 image, (k8s: 1.24.17, docker: 25.0.*, containerd: 1.7.*)
  instance_type = var.docker_instance.instance_type
  key_name      = "boto-test"  # SSH key
  subnet_id     = aws_subnet.docker_subnet.id
  security_groups = [
    aws_security_group.docker_firewall.name,
  ]

  user_data = file("startup.sh")

  tags = {
    Name = var.docker_instance.instance_name
  }
}