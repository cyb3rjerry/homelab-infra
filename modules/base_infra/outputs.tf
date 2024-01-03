output "nodes" {
  description = "All nodes within the cluster"
  value = {
    pve  = data.proxmox_virtual_environment_hosts.pve
    pve2 = data.proxmox_virtual_environment_hosts.pve2
    pve3 = data.proxmox_virtual_environment_hosts.pve3
  }
}

output "templates" {
  description = "All templates defined within our cluster"
  value = {
    flare_template = data.proxmox_virtual_environment_vm.flare_template
  }
}

output "isos" {
  description = "All available isos"
  value = {
    Win10 = proxmox_virtual_environment_file.windows-10-22H2
  }
}

output "pools" {
  description = "All pools accessible within our cluster"
  value = {
    VM_Storage_pool = "VM-Storage-Pool"
  }
}
