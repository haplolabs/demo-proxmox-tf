variable "vm_count" {
  description = "Number of VMs"
  type = number
}

variable "access_key" {
  description = "Access key to access state bucket"
  type = string
}

variable "secret_key" {
  description = "Secret key to access state bucket"
  type = string
}

variable "s3_endpoint" {
  description = "s3 API endpoint"
  type = string
}

variable "state_region" {
  description = "Region where state bucket resides"
  type = string
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
