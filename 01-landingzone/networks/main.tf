#### Module for provisioning Cusotm VPC with 2 Subnets

module "vpc" {
  source         = "../modules/vpc"
  project_id     = var.mgmt_project_id
  network_name   = var.mgmt_network_name
  subnet_name_01 = var.mgmt_subnet_01_name
  subnet_name_02 = var.mgmt_subnet_02_name
}

# module "gke" {
#   source          = "../modules/gke"
#   cluster_name    = "xpcp-cluster-poc"
#   location        = "us-central1"
#   project_id      = "team-alpha-dev"
#   subnet_name_01  = "default"  # team-alpha-network
#   node_pool_name  = "xp-cluster-node-pool-1"
#   node_locations  = ["us-central1-a"]
#   worker_nodes_count  = "2"
#   worker_nodes_disk_size = "10"
#   worker_node_type  = "n1-standard-1"
#   # depends_on = [
#   #   module.vpc
#   # ]
# }