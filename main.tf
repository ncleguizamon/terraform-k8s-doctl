variable "do_token" {}

provider "digitalocean" {
  token = "${var.do_token}"
}
variable "cluster-name" {}
variable "cluster-region" {}
variable "cluster-version" {}
variable "cluster-node-pool-name" {}
variable "cluster-node-pool-size" {}
variable "cluster-node-pool-node-count" {}

resource "digitalocean_kubernetes_cluster" "cluster" {
  name    = "${var.cluster-name}"
  region  = "${var.cluster-region}"
  version = "${var.cluster-version}"
  tags = ["${var.cluster-name}"]

  node_pool {
    name       = "${var.cluster-node-pool-name}"
    size       = "${var.cluster-node-pool-size}"
    node_count = "${var.cluster-node-pool-node-count}"
  }
}