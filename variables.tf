variable "network" {
  description = "Specifies the logical network for the virtual machines."
  default     = "VM network"
}

variable "template" {
  description = "Specifies the VM template name."
  default     = "Nested_ESXi6.7u3_Appliance_Template_v1"
}


variable "default_password" {
  description = "Specifies the default password for the hosts if var.random_password == false."
  default     = "VMware1!"
}


variable "gateway" {
  description = "Specifies the default gateway."
  default     = ""
}

variable "vlan" {
  description = "Specifies the VLAN ID of vmk0."
  default     = ""
}

variable "dns_server" {
  description = "Specifies the primary DNS server."
  default     = "192.168.1.202,8.8.8.8"
}

variable "ntp_server" {
  description = "Specifies the NTP server."
  default     = "pool.ntp.org"
}

variable "syslog" {
  description = "Specifies the remote syslog server."
  default     = ""
}

variable "ssh" {
  description = "Enable SSH."
  default     = "True"
}

variable "createvmfs" {
  description = "Format the secondary disks as datastores."
  default     = "False"
}

variable "debug" {
  description = "Enable debug mode."
  default     = "False"
}
