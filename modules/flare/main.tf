module "base_infra" {
  source = "../base_infra"
}

resource "proxmox_virtual_environment_vm" "flare" {
  node_name = module.base_infra.nodes.pve2.node_name
  name      = "flare"
  tags      = ["terraform", "windows", "malware"]
  vm_id     = 1337

  started = false // this way TF doesn't hang waiting on windows to boot

  clone {
    vm_id = module.base_infra.templates.flare_template.id
    full  = false
  }

  agent {
    enabled = true
  }

  disk {
    datastore_id = module.base_infra.pools.VM_Storage_pool
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
    file_id   = module.base_infra.isos.Win10.id
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

