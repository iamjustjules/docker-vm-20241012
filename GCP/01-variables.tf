variable "setup" {
  type = map(string)
  default = {
    project = "justjules-docker"
    region  = "us-central1"
    zone    = "us-central1-a"
  }
}

variable "docker_network" {
  type = map(string)
  default = {
    vpc           = "docker-vpc"
    subnet        = "docker-subnet"
    region        = "us-central1"
    cidr          = "10.40.0.0/24"
    firewall_name = "docker-firewall"
  }
}

variable "docker_instance" {
  type = map(string)
  default = {
    machine_type  = "e2-medium"
    instance_name = "docker-instance"
  }
}
