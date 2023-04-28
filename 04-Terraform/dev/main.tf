#### Module for provisioning Cusotm VPC with 2 Subnets

module "vpc" {
  source          = "../modules/vpc"
  project_id      = var.project_id
  network_name    = var.network_name
  subnet_name_01  = var.subnet_name_01
  subnet_name_02  = var.subnet_name_02
}


#### Module for provisioning GKE Standard CLuster based on Cloud Fabric


# locals {
#   poc_network = data.terraform_remote_state.dev.outputs.network_name
# }

# data "terraform_remote_state" "dev" {
#   backend = "gcs"
#   config = {
#     bucket = var.remote_state_bucket
#     prefix = "terraform/dev/"
#   }
# }



module "cluster-1" {
  source     = "../modules/gke-cluster-standard"
  project_id = var.project_id
  name       = var.cluster_name
  location   = module.vpc.subnet01.region
  vpc_config = {
    network    = module.vpc.vpc-network    # var.vpc.self_link
    subnetwork = module.subnet01   # var.subnet.self_link
    secondary_range_names = {
      pods     = "pods"
      services = "services"
    }
    master_authorized_ranges = {
      internal-vms = "10.0.0.0/8"
    }
    master_ipv4_cidr_block = "192.168.4.0/28"
  }
  max_pods_per_node = 32
  private_cluster_config = {
    enable_private_endpoint = false
    master_global_access    = true
  }
  labels = {
    environment = "dev"
  }
  depends_on = [
    module.vpc
  ]
}

####  Node Pool Configuration module

module "cluster-1-nodepool-1" {
  source       = "../modules/gke-nodepool"
  project_id   = var.project_id
  cluster_name = var.cluster_name
  location     = var.cluster_zone
  name         = "nodepool-1"
  labels       = { environment = "dev" }
  service_account = {
    create       = true
    email        = "nodepool-1" # optional
    oauth_scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }
  node_config = {
    machine_type        = "n2-standard-2"
    disk_size_gb        = 50
    disk_type           = "pd-ssd"
    ephemeral_ssd_count = 1
    gvnic               = true
    spot                = true
  }
  nodepool_config = {
    autoscaling = {
      max_node_count = 4
      min_node_count = 3
    }
    management = {
      auto_repair  = true
      auto_upgrade = true
    }
  }
  depends_on = [
    module.cluster-1
  ]
}