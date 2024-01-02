data "proxmox_virtual_environment_vm" "flare_template" {
  // Turns out windows is an absolute pain to virtualize
  // what I've ended up doing, and what I recommend, is
  // to simply create a template manually and then leverage
  // it for future deployment. I highly recommend backing up
  // your template somewhere.
  node_name = data.proxmox_virtual_environment_hosts.pve2.node_name
  vm_id     = 102
}

