#### Module for provisioning Cusotm VPC with 2 Subnets
module "gke" {
  source                 = "../modules/gke"
  cluster_name           = "poc-cluster-dev"
  location               = "us-central1-a"
  project_id             = "team-alpha-mgmt"
  network_name           = "poc-network"
  subnet_name_01         = "subnet01"
  node_pool_name         = "xp-cluster-node-pool-1"
  node_locations         = ["us-central1-a"]
  worker_nodes_count     = "3"
  worker_nodes_disk_size = "10"
  worker_node_type       = "e2-medium"
  # depends_on = [
  #   module.vpc
  # ]

  config_connector_config {
    enabled = true
  }
}