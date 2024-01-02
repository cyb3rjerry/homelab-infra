locals {
  general_pool = "VM-Storage-Pool"
  local_lvm    = "local-lvm"

  nodes = {
    pve = {
      name   = "pve"
      cpus   = 12
      memory = 64
    }
    pve2 = {
      name   = "pve2"
      cpus   = 12
      memory = 32
    }
    pve3 = {
      name   = "pve3"
      cpus   = 4
      memory = 32
    }
  }
}
