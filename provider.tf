terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.42.1"
    }
  }
}

provider "proxmox" {
  endpoint = "https://172.16.0.10:8006/"
  insecure = true
  ssh {
    agent = true

    node {
      name    = "pve"
      address = "172.16.0.10"
    }

    node {
      name    = "pve2"
      address = "172.16.0.11"
    }

    node {
      name    = "pve3"
      address = "172.16.0.12"
    }
  }
}
