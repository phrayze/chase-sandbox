
output "cluster" {
  description = "Cluster resource."
  sensitive   = true
  value       = google_container_cluster.cluster
}