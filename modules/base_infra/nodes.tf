data "proxmox_virtual_environment_hosts" "pve" {
  node_name = "pve"
}

data "proxmox_virtual_environment_hosts" "pve2" {
  node_name = "pve2"
}

data "proxmox_virtual_environment_hosts" "pve3" {
  node_name = "pve3"
}
