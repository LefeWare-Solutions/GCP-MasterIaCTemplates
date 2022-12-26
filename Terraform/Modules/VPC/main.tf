resource "google_compute_network" "vpc_network" {
  name                            = var.vpc_name
  auto_create_subnetworks         = false
  routing_mode                    = "GLOBAL"
  delete_default_routes_on_create = true
}

resource "google_compute_subnetwork" "subnetwork" {
  for_each                 = var.subnets
  name                     = each.value.subnet_name
  ip_cidr_range            = each.value.subnet_ip
  region                   = each.value.subnet_region
  network                  = google_compute_network.vpc_network.name
  private_ip_google_access = each.value.private_ip_google_access
}