module "vpc" {
  source     = "../../modules/vpc"
  cidr_block = var.vpc_cidr
  name       = "dev-vpc"
}

module "subnet" {
  source                 = "../../modules/subnet"
  vpc_id                 = module.vpc.vpc_id
  cidr_block             = var.subnet_cidr
  az                     = var.availability_zone
  map_public_ip_on_launch = true
  name                   = "dev-subnet"
}
