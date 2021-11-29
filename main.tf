# ****network*****


resource "google_compute_network" "vpc_network" {

  name                    = var.name
  description             = var.description
  auto_create_subnetworks = var.auto_create_subnetworks
  routing_mode            = var.routing_mode
  mtu                     = var.mtu
  project                 = var.project

}

#      *****subnet*****

resource "google_compute_subnetwork" "vpc_subnet" {

  ip_cidr_range              = var.ip_cidr_range
  name                       = var.subnet_name
  network                    = var.network
  description                = var.subnet_description
  purpose                    = var.purpose
  role                       = var.role
  private_ip_google_access   = var.private_ip_google_access
  private_ipv6_google_access = var.private_ipv6_google_access
  region                     = var.region
  stack_type                 = var.stack_type
  ipv6_access_type           = var.ipv6_access_type
  project                    = var.project

  log_config {
    aggregation_interval = var.aggregation_interval
    flow_sampling        = var.flow_sampling
    metadata             = var.metadata
    metadata_fields      = var.metadata_fields
    filter_expr          = var.filter_exp
  }

  secondary_ip_range {
    range_name    = var.range_name
    ip_cidr_range = var.secondary_ip_cidr_range
  }

}