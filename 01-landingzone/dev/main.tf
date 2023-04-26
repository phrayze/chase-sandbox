#### Module for provisioning Cusotm VPC with 2 Subnets

module "vpc" {
  source          = "../modules/vpc"
  project_id      = "chaseio-dev"
  network_name    = "chase-network"
  subnet_name_01  = "subnet01"
  subnet_name_02  = "subnet02"
}