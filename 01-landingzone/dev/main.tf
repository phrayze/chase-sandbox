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

}

module "project-services" {
  source  = "terraform-google-modules/project-factory/google//modules/project_services"
  version = "~> 14.2"

  project_id                  = var.project_id

  activate_apis = [
    "anthos.googleapis.com",
    "anthosconfigmanagement.googleapis.com",
  ]
}

resource "google_gke_hub_membership" "membership" {
  membership_id = "basic"
  endpoint {
    gke_cluster {
      resource_link = module.gke.id
    }
  }
  authority {
    issuer = "https://container.googleapis.com/v1/${module.gke.id}"
  }
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