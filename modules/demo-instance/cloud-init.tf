/*  Null resource that generates a cloud-config file per vm */
data "template_file" "user_data" {
  count    = var.vm_count
  template = file("${path.module}/files/user_data.cfg")
  vars     = {
    ansible_user  = var.ansible_user
    ansible_uid   = var.ansible_uid
    ansible_gid   = var.ansible_gid
    my_user       = var.my_user
    my_uid        = var.my_uid
    my_gid        = var.my_gid
    pubkey   = file(pathexpand("~/.ssh/id_ed25519.pub"))
    ansible_pubkey   = file(pathexpand("~/.ssh/ansible_${var.ansible_user}.pub"))
    hostname = "arch-test-${count.index}"
    fqdn     = "arch-test-${count.index}.${var.domain_name}"
  }
}
resource "local_file" "cloud_init_user_data_file" {
  count    = var.vm_count
  content  = data.template_file.user_data[count.index].rendered
  filename = "${path.module}/files/arch-test-${count.index}-user.cfg"
}

resource "null_resource" "cloud_init_config_files" {
  count = var.vm_count

  provisioner "local-exec" {
    command = "cp ${local_file.cloud_init_user_data_file[count.index].filename} /pve/backups/snippets/arch-test-${count.index}-user.yaml"
  }
}

