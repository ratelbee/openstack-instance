output "address" {
  value = openstack_compute_instance_v2.instance.*.access_ip_v4
}

output "storage" {
  value =  openstack_compute_instance_v2.instance.*.block_device
}