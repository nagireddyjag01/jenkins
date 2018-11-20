provider "google" {
  credentials = "${file("${var.gcp_credentials}")}"
  project     = "${var.gcp_project}"
  region      = "${var.gcp_region}"
}

resource "google_container_cluster" "primary" {
  name               = "${var.cluster_name}"
  zone               = "${var.cluster_zone}"
  project 	         = "${var.gcp_project}"
  description        = "${var.cluster_description}"
  initial_node_count = "${var.cluster_initial_node_count}"
  additional_zones   = "${var.cluster_addl_zones}"
  network            = "${var.cluster_network}"
  subnetwork         = "${var.cluster_subnetwork}"
  logging_service    = "${var.cluster_logging_service}"
  monitoring_service = "${var.cluster_monitoring_service}"

  master_auth {
    username = "${var.cluster_http_admin_user}"
    password = "${var.cluster_http_admin_pwd}"
  }

  node_version	    = "${var.cluster_kube_version}"
  min_master_version = "${var.cluster_kube_version}"
  node_config {
    machine_type    = "${var.cluster_machine_type}"
    disk_size_gb    = "${var.cluster_disk_size_gb}"
    local_ssd_count = "${var.cluster_local_ssd_count}"
    metadata        = "${var.cluster_metadata}"
    image_type      = "${var.cluster_image_type}"
    service_account = "${var.cluster_service_account}"
    oauth_scopes    = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }

  addons_config {
    http_load_balancing {
      disabled = false
    }
    horizontal_pod_autoscaling {
      disabled = false
    }
  }

  timeouts {
    create = "20m"
    update = "10m"
    delete = "10m"
  }
}