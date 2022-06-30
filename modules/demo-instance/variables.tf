variable "vm_count" {
  description = "Number of VMs"
  type = number
}

variable "domain_name" {
  description = "VM Domain name"
  type = string
}

variable "ansible_user" {
  description = "Username for the ansible user"
  type = string
}

variable "my_user" {
  description = "My user"
  type = string
}

variable "ansible_uid" {
  description = "UID of the ansible user"
  type = number
}

variable "ansible_gid" {
  description = "GID of the ansible user"
  type = number
}

variable "my_uid" {
  description = "UID of my user"
  type = number
}

variable "my_gid" {
  description = "GID of my user"
  type = number
}
