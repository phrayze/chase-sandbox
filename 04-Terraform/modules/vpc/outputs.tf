/**
 * Copyright 2022 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

# output "ca_certificate" {
#   description = "Public certificate of the cluster (base64-encoded)."
#   value       = google_container_cluster.cluster.master_auth.0.cluster_ca_certificate
#   sensitive   = true
# }

# output "cluster" {
#   description = "Cluster resource."
#   sensitive   = true
#   value       = google_container_cluster.cluster
# }

output "vpc-network" {
    description = "vpc-network"
    value = google_compute_network.vpc-network
}

output "vpc-subnet01" {
    description = "subnet01"
    value = google_compute_subnetwork.subnet01
}

output "vpc-subnet02" {
    description = "subnet02"
    value = google_compute_subnetwork.subnet01
}