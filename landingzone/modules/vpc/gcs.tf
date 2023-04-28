#### Created a GCS bucket Manually for storing tf state

# resource "random_id" "number" {
#   byte_length = 4
# }

# resource "google_storage_bucket" "tf-backend" {
#   name          = "tf-backend-${random_id.number.hex}"
#   location      = "US"
#   project       = var.project_id
#   versioning {
#     enabled = true
#   }
# }