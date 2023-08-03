data "template_file" "init_config" {
  count    = var.instance_count
  template = file("${var.custom_template != "" ? var.custom_template : local.defined_template}")
  vars = {
    admin     = var.admin
    ssh_keys  = var.ssh_keys
    hostname  = format("${local.full_name}-%02d", count.index + var.index_start)
    fqdn      = "${format("${local.full_name}-%02d", count.index + var.index_start)}.${var.fqdn}"
    time_zone = var.time_zone
  }
}
