variable "gcp_credentials" {}
variable "gcp_project" {
  default = "webkube-219004"
}
variable "gcp_region" {
  default = "asia-south1"
}
variable "cluster_name" {
  default = "jagakubemas"
}
variable "cluster_description" {
  default = "cluster created through terraform"
}
variable "cluster_region" {
  default = "asia-south1"
}
variable "cluster_zone" {
  default = "asia-south1-a"
}
variable "cluster_addl_zones" {
  default = []
}
variable "cluster_initial_node_count" {
  default = "3"
}
variable "cluster_network" {
  default = "default"
}
variable "cluster_subnetwork" {
  default = "default"
}
variable "cluster_kube_version" {
  default = "latest"
}
variable "cluster_http_admin_user" {
  default = "k8sadm"
}
variable "cluster_http_admin_pwd" {
  default = "Nagireddy@-k8sadm"
}
variable "cluster_logging_service" {
  default = "none"
}
variable "cluster_monitoring_service" {
  default = "none"
}
variable "cluster_machine_type" {
  default = "n1-standard-1"
}
variable "cluster_disk_size_gb" {
  default = "10"
}
variable "cluster_local_ssd_count" {
  default = "0"
}
variable "cluster_metadata" {
  type = "map"
  default {
    "env" = "stg",
    "region" = "as"
  }
}
variable "cluster_image_type" {
  default = "cos"
}
variable "cluster_service_account" {
  default = "autoscript@webkube-219004.iam.gserviceaccount.com"
}
variable "label_env" {
  default = "stg"
}
variable "label_region" {
  default = "as"
}

variable "gce_ssh_user" {
  default = "nagireddyani"
}
variable "gce_ssh_pub_key_file" {}
