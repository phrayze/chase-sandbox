#### Module for provisioning Cusotm VPC with 2 Subnets

module "vpc" {
  source         = "../modules/vpc"
  project_id     = "team-alpha-mgmt"
  network_name   = "poc-network"
  subnet_name_01 = "subnet01"
  subnet_name_02 = "subnet02"
}

# module "gke" {
#   source          = "../modules/gke"
#   cluster_name    = "xpcp-cluster-poc"
#   location        = "us-central1"
#   project_id      = "chaseio-dev"
#   subnet_name_01  = "defaut"  # chase-network
#   node_pool_name  = "xp-cluster-node-pool-1"
#   node_locations  = ["us-central1-a"]
#   worker_nodes_count  = "2"
#   worker_nodes_disk_size = "10"
#   worker_node_type  = "n1-standard-1"
#   # depends_on = [
#   #   module.vpc
#   # ]
# }