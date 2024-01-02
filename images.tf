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
  node_name    = local.nodes.pve2.name

  source_file {
    path = "https://software.download.prss.microsoft.com/dbazure/Win10_22H2_English_x64v1.iso?t=f75569fe-5bdf-43b8-a4f2-b0e66f863cde&e=1704224645&h=8d104d50d76cbe708a36f1c0d0bd207d6fd6af3a5938acff1eb83bf42b9c1178"
  }
}

resource "proxmox_virtual_environment_file" "virtio-drivers" {
  content_type = "iso"
  datastore_id = "local"
  node_name    = local.nodes.pve2.name
}

