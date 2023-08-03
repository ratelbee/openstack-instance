resource "openstack_compute_instance_v2" "instance" {
  count           = var.instance_count
  name            = format("${local.full_name}-%02d", count.index + var.index_start)
  flavor_name     = var.flavor
  security_groups = var.sec_groups
  user_data       = element(data.template_file.init_config.*.rendered, count.index)

  block_device {
    uuid                  = var.image_id
    source_type           = "image"
    volume_size           = var.storage_size
    boot_index            = 0
    destination_type      = "volume"
    delete_on_termination = true
  }

  network {
    name = var.net_name
  }
  provisioner "local-exec" {
    interpreter = ["/bin/bash", "-c"]
    environment = {
      PROVISION_IP_ADDRESS   = self.access_ip_v4
      PROVISION_SSH_USER     = var.admin
      PROVISION_SSH_PORT     = var.ssh_port
      PROVISION_SSH_KEY_PATH = var.ssh_private_key
      PROVISION_SSH_ARGS     = "-o UserKnownHostsFile=/dev/null -o StrictHostKeychecking=no"
    }
    command = <<-EOT
  chmod 600 $${PROVISION_SSH_KEY_PATH}
  echo $${PROVISION_SSH_KEY_PATH}
  ssh -p $${PROVISION_SSH_PORT} -i $${PROVISION_SSH_KEY_PATH} $${PROVISION_SSH_ARGS} $${PROVISION_SSH_USER}@$${PROVISION_IP_ADDRESS} \
      '(sleep 2; sudo shutdown -r now)&'
  sleep 10
  until ssh -p $${PROVISION_SSH_PORT} -i $${PROVISION_SSH_KEY_PATH} $${PROVISION_SSH_ARGS} -o ConnectTimeout=10 \
      $${PROVISION_SSH_USER}@$${PROVISION_IP_ADDRESS} 'true 2> /dev/null'
  do
    echo "Waiting for node to reboot and become available"
    sleep 3
  done
  echo \"SUCCESS\"
  EOT
  }
}
