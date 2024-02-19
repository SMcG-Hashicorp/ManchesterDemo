provider "vsphere" {
  vsphere_server       = "${var.vsphere_server}"
  user                 = "${var.vsphere_user}"
  password             = "${var.vsphere_password}"
  allow_unverified_ssl = true
}
variable "vsphere_server" {
  default = "vcenter67.vsphere.lab"
}
variable "vsphere_user" {
  default = "administrator@vsphere.local"
}
variable "vsphere_password" {
  default = "VMware1!"
}

data "vsphere_datacenter" "dc" {
  name = "VM-Lab"
}

#data "vsphere_resource_pool" "pool" {
#  name          = "Compute-ResourcePool"
#  datacenter_id = "${data.vsphere_datacenter.dc.id}"
#}

#data "vsphere_datastore" "datastore" {
#  name          = "WorkloadDatastore"
#  datacenter_id = "${data.vsphere_datacenter.VM-Lab.id}"
#}

data "vsphere_datacenter" "VM-Lab" {
  name = "VM-Lab"
}

data "vsphere_compute_cluster" "Lab-Cluster" {
  name          = "Lab-Cluster"
  datacenter_id = "${data.vsphere_datacenter.VM-Lab.id}"
}

#data "vsphere_datastore" "DStoresSources" {
# name          = "DStoresSources"
# datacenter_id = "${data.vsphere_datacenter.VM-Lab.id}"
#}

#data "vsphere_network" "VM network" {
#  name          = "VM Network"
#  datacenter_id = "${data.vsphere_datacenter.VM-Lab.id}"
#}

resource "vsphere_folder" "VM-lab" {
     path          = "VM-Lab-Manchester-02"
     type          = "vm"
     datacenter_id = "${data.vsphere_datacenter.VM-Lab.id}"
}

# Get data about the image you're going to clone from.
data "vsphere_virtual_machine" "Nested_ESXi67u3_Appliance_Template_v1" {
    name = "Nested_ESXi67u3_Appliance_Template_v1"
    datacenter_id = "${data.vsphere_datacenter.VM-Lab.id}"
}
