resource "proxmox_virtual_environment_vm" "testing" {
  node_name = "pve"
  name      = "flare"
  tags      = ["terraform", "windows", "malware"]

  started = false // this way TF doesn't hang waiting on windows to boot

  agent {
    enabled = true
  }

  disk {
    datastore_id = local.general_pool
    interface    = "scsi0"
    size         = 200
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
    cores = 8
    type  = "host" // https://forum.proxmox.com/threads/my-windows-vm-is-very-slow.119271/
    flags = ["+aes"]
  }

  network_device {
    bridge = "vmbr0"
  }

  operating_system {
    type = "win10"
  }

  machine = "pc"
}

