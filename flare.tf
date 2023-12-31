resource "proxmox_virtual_environment_vm" "testing" {
  node_name = "pve"
  name      = "flare"
  tags      = ["terraform", "windows", "malware"]

  disk {
    datastore_id = local.general_pool
    interface    = "scsi0"
    size         = 200
  }

  memory {
    dedicated = 16000
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
    enabled   = true
    file_id   = proxmox_virtual_environment_file.windows-10-22H2.id
    interface = "ide0"
  }

  cpu {
    cores = 8
  }
}

