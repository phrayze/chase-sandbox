variable "network_name" {
  #default = "poc-network"
  type = string
}

variable "subnet_name_01" {
  description = "Subnet1 name"
  type        = string
  default     = "subnet01"
}
variable "subnet_name_02" {
  description = "Subnet2 name"
  type        = string
  default     = "subnet02"
}

variable "project_id" {
  description = "Cluster project id."
  type        = string
  default     = "chaseio-dev"
}

variable "cluster_name" {
  description = "Cluster Name."
  type        = string
  default     = "chaseio-dev-cluster"
}

variable "location" {
  description = "Cluster Location."
  type        = string
  default     = "us-central1-a"
}

variable "node_pool_name" {
  description = "Cluster Node Pool Name."
  type        = string
  default     = "node-pool-1"
}

variable "node_locations" {
  description = "Nodes Location."
  type        = list(any)
}

variable "worker_nodes_count" {
  description = "Count of Nodes"
  default     = 3
}

variable "worker_nodes_disk_size" {
  description = "Disk Size for associated nodes"
}

variable "worker_node_type" {
  description = "Cluster Node Type"
  type        = string
  default     = "n1-standard-1"
}