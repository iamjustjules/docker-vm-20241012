variable "setup" {
  type = map(string)
  default = {
    region = "us-east-1"
  }
}

variable "docker_network" {
  type = map(string)
  default = {
    vpc           = "docker-vpc"
    subnet        = "docker-subnet"
    cidr          = "10.40.0.0/24"
    firewall_name = "docker-firewall"
  }
}

variable "docker_instance" {
  type = map(string)
  default = {
    instance_type = "t2.micro"
    instance_name = "docker-instance"
  }
}
