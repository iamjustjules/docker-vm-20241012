# Include network and VM definitions
module "network" {
  source = "./network.tf"
}

module "vm" {
  source = "./vm.tf"
}
