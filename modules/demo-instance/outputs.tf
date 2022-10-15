output "private_ip" {
  value = proxmox_vm_qemu.cloudinit-test.default_ipv4_address
}

output "fedora_private_ip" {
  value = proxmox_vm_qemu.fedora36-test.default_ipv4_address 
} 
