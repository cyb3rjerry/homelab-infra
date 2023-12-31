resource "proxmox_virtual_environment_file" "ubuntu-cloud-server-23" {
  content_type = "iso"
  datastore_id = "local"
  node_name    = local.nodes.pve.name

  source_file {
    path = "https://cloud-images.ubuntu.com/lunar/current/lunar-server-cloudimg-amd64.img"
  }
}

resource "proxmox_virtual_environment_file" "windows-10-22H2" {
  content_type = "iso"
  datastore_id = "local"
  node_name    = local.nodes.pve.name

  source_file {
    path = "https://software.download.prss.microsoft.com/dbazure/Win10_22H2_English_x64v1.iso?t=fbfea52d-5747-4db2-9fba-1a4bc2ad2cbb&e=1704076788&h=ca8a1fc4e187748e27904776606d8523e45351d4d7b0d734d76704a81fc01232"
  }
}

resource "proxmox_virtual_environment_file" "virtio-drivers" {
  content_type = "iso"
  datastore_id = "local"
  node_name    = local.nodes.pve.name
}
