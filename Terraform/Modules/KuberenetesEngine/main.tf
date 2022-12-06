resource "google_service_account" "default" {
  account_id   = var.service_account_id
  display_name = var.service_account
}

resource "google_container_cluster" "primary" {
  name               =  var.cluster_name
  location           =  var.region
  initial_node_count =  var.gke_num_nodes
  node_config {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    service_account = google_service_account.default.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
    labels = {
      foo = "bar"
    }
    tags = ["foo", "bar"]
  }
  timeouts {
    create = "30m"
    update = "40m"
  }
}