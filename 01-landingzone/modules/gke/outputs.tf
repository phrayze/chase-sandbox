
output "cluster" {
  description = "Cluster resource."
  sensitive   = true
  value       = google_container_cluster.primary
}

output "id" {
  description = "Cluster ID."
  value       = google_container_cluster.primary.id
}