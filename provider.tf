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
  }
}
