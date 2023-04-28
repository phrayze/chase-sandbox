#### Module for provisioning Cusotm VPC with 2 Subnets

module "vpc" {
  source         = "../modules/vpc"
  project_id     = var.mgmt_project_id
  network_name   = var.mgmt_network_name
  subnet_name_01 = var.mgmt_subnet_01_name
  subnet_name_02 = var.mgmt_subnet_02_name
}

resource "google_project_services" "mgmt-project" {
  project  = var.mgmt_project_id
  services = ["anthos.googleapis.com", "anthosconfigmanagement.googleapis.com"]
}

resource "google_gke_hub_feature" "configmanagement_acm_feature" {
  name     = "configmanagement"
  location = "global"
  provider = google-beta
}

resource "google_gke_hub_feature_membership" "feature_member" {
  provider   = google-beta
  location   = "global"
  feature    = "configmanagement"
  membership = google_gke_hub_membership.membership.membership_id
  configmanagement {
    version = "1.14.3"

    policy_controller {
      enabled                    = true
      template_library_installed = true
      referential_rules_enabled  = true
    }
  }
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