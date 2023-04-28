variable "network_name" {
    default = "chase-network"
    type    = string
}

variable "subnet_name_01" {
  description = "Subnet1 name"
  type        = string
  default     = "subnet01"
}
variable "subnet_name_02" {
  description = "Subnet2 name"
  type        = string
  default = "subnet02"
}

variable "project_id" {
  description = "Cluster project id."
  type        = string
  default     = "chaseio-dev"
}

# variable "remote_state_bucket" {
#   description = "remote state bucket name"
#   type        = string
# }