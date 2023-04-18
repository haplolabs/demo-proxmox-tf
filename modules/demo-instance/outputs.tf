output "private_ip" {
  value = proxmox_vm_qemu.cloudinit-test.default_ipv4_address
}

output "fedora_private_ip" {
  value = proxmox_vm_qemu.fedora36-test.default_ipv4_address
} 

output "arch_private_ips" {
  value = proxmox_vm_qemu.arch-test.*.default_ipv4_address
}
