/* Configure Cloud-Init User-Data with custom config file */
resource "proxmox_vm_qemu" "cloudinit-test" {
  name        = "jammy-test-1.haplolabs.io"
  desc        = "Test Ubuntu 22.04"
  target_node = "pve"

  clone = "Ubuntu22.04LTS"


  agent   = 1
  cores   = 1
  sockets = 1
  memory  = 2048

  ssh_user        = "serveradmin"

  os_type   = "cloud-init"
  ipconfig0 = "ip=192.168.103.45/24,gw=192.168.103.1"

  /*
    sshkeys and other User-Data parameters are specified with a custom config file.
    In this example each VM has its own config file, previously generated and uploaded to
    the snippets folder in the local storage in the Proxmox VE server.
  */
  cicustom                = "user=backups:snippets/jammy-test-2-user.yaml"
  /* Create the Cloud-Init drive on the "local-lvm" storage */
  cloudinit_cdrom_storage = "backups"

  disk {
    type    = "scsi"
    size    = "20G"
    storage = "backups"
    format  = "raw"
    backup  = 1
  }

  network {
    model     = "virtio"
    bridge    = "vmbr0"
    tag       = "103"
  }

  vga {
    memory    = 0
    type      = "serial0"
  }

}
resource "proxmox_vm_qemu" "fedora36-test" {
  name        = "fedora-test-1.haplolabs.io"
  desc        = "Test Fedora 36"
  target_node = "pve3"

  clone = "Fedora36"


  agent   = 1
  cores   = 1
  sockets = 1
  memory  = 2048

  ssh_user        = "serveradmin"

  os_type   = "cloud-init"
  /* ipconfig0 = "ip=192.168.103.45/24,gw=192.168.103.1" */

  /*
    sshkeys and other User-Data parameters are specified with a custom config file.
    In this example each VM has its own config file, previously generated and uploaded to
    the snippets folder in the local storage in the Proxmox VE server.
  */
  cicustom                = "user=backups:snippets/fedora-test-1-user.yaml,network=backups:snippets/fedora-test-1-network.yaml"
  /* Create the Cloud-Init drive on the "local-lvm" storage */
  cloudinit_cdrom_storage = "backups"

  disk {
    type    = "scsi"
    size    = "20G"
    storage = "backups"
    backup  = 1
  }

  network {
    model     = "virtio"
    bridge    = "vmbr0"
    tag       = "103"
  }

  vga {
    memory    = 0
    type      = "serial0"
  }

}

resource "proxmox_vm_qemu" "arch-test" {
  name        = "arch-test-1.haplolabs.io"
  desc        = "Test Arch Linux"
  target_node = "pve2"

  clone = "ArchLinux"


  agent   = 1
  cores   = 1
  sockets = 1
  memory  = 2048

  ssh_user        = "serveradmin"

  os_type   = "cloud-init"
  /* ipconfig0 = "ip=192.168.103.45/24,gw=192.168.103.1" */

  /*
    sshkeys and other User-Data parameters are specified with a custom config file.
    In this example each VM has its own config file, previously generated and uploaded to
    the snippets folder in the local storage in the Proxmox VE server.
  */
  cicustom                = "user=backups:snippets/arch-test-1-user.yaml,network=backups:snippets/arch-test-1-network.yaml"
  /* Create the Cloud-Init drive on the "local-lvm" storage */
  cloudinit_cdrom_storage = "backups"

  disk {
    type    = "scsi"
    size    = "10G"
    storage = "backups"
    backup  = 1
  }

  network {
    model     = "virtio"
    bridge    = "vmbr0"
    tag       = "103"
  }

  vga {
    memory    = 0
    type      = "serial0"
  }

}
