resource "proxmox_virtual_environment_vm" "flare" {
  node_name = data.proxmox_virtual_environment_hosts.pve2.node_name
  name      = "flare"
  tags      = ["terraform", "windows", "malware"]
  vm_id     = 1337

  started = false // this way TF doesn't hang waiting on windows to boot

  clone {
    vm_id = data.proxmox_virtual_environment_vm.flare_template.id
    full  = false
  }

  agent {
    enabled = true
  }

  disk {
    datastore_id = local.general_pool
    interface    = "scsi0"
    size         = 200
    file_format  = "raw"
  }

  memory {
    dedicated = 32000
  }

  /* Two cdroms currently isn't supported so we have to load the virtio-drivers
   * manually via the gui
   * See https://github.com/bpg/terraform-provider-proxmox/issues/718
  cdrom {
    enabled   = true
    file_id   = proxmox_virtual_environment_file.virtio-drivers.id
    interface = "ide2"
  }
  */

  cdrom {
    enabled   = false // set to true on initial install
    file_id   = proxmox_virtual_environment_file.windows-10-22H2.id
    interface = "ide0"
  }

  cpu {
    cores = 12
    type  = "host" // https://forum.proxmox.com/threads/my-windows-vm-is-very-slow.119271/
    flags = ["+aes"]
  }

  network_device {
    bridge = "vmbr0"
  }

  operating_system {
    type = "win10"
  }

  vga {
    type = "qxl"
  }

  machine = "pc"
}

