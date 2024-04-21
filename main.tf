# main.tf
terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "2.36.0"
    }
  }
}
provider "digitalocean" {
  token = "dop_v1_53c98b4f9d62b8e481447983de67454e4321276fbc52b44bd875284611eb72d2"
}

resource "digitalocean_kubernetes_cluster" "flask_app" {
  name    = "flask-cluster"
  region  = "nyc1"
  version = "1.29.1-do.0"

  node_pool {
    name       = "default"
    size       = "s-1vcpu-2gb"
    node_count = 1
  }
}

