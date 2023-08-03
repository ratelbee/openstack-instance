locals {
  full_name = "${var.district != "" ? "${var.district}-" : ""}${var.hostname != "default" ? var.hostname : var.module_template}"
  defined_template = "${path.module}/templates/conf/${var.module_template}.tpl"
}

variable "instance_count" {
  description = "Count of VMs"
  default     = 1
}

variable "index_start" {
  description = "From where the indexing start"
  default     = 1
}

variable "district" {
  description = "VM hostname prefix"
  default     = ""
}

variable "module_template" {
  description = "Choosing a template for a service"
  type        = string
  default     = "default"
}

variable "hostname" {
  description = "VM hostname"
  type        = string
  default     = "default"
}

variable "fqdn" {
  description = "VM or FQDN"
  type        = string
  default     = "local"
}

variable "storage_size" {
  description = "System Volume size (GB)"
  type    = number
  default = 13
}

variable "admin" {
  description = "Admin user with ssh access"
  default     = "ssh-admin"
}

variable "ssh_keys" {
  description = "Public ssh keys"
  type        = string
  default     = ""
}

variable "ssh_port" {
  description = "Public ssh port"
  type        = number
  default     = 22
}

variable "time_zone" {
  description = "Time Zone"
  default     = "Europe/Moscow"
}

variable "ssh_private_key" {
  description = "Private key for SSH connection test"
  default     = ""
}

variable "custom_template" {
  description = "Set A custom Template Path"
  type        = string
  default     = ""
}

variable "flavor" {
  description = "Set A Type Instance"
  type        = string
  default     = "1x1024"
}

variable "sec_groups" {
  description = "Set A Security groups"
  type        = list(string)
  default     = ["default"]
}

variable "net_name" {
  description = "Set A Network Name"
  type        = string
  default     = ""
}

variable "image_id" {
  description = "Set A Image ID"
  type        = string
  default     = ""
}
