#cloud-config

packages:
  - vim
  - curl

hostname: ${hostname}
fqdn: ${fqdn}
manage_etc_hosts: true

ssh_pwauth: no
users:
  - name: ${admin}
    gecos: CI User
    lock-passwd: false
    sudo: ALL=(ALL) NOPASSWD:ALL
    system: False
    ssh_authorized_keys: ${ssh_keys}
    shell: /bin/bash

disable_root: true

write_files:
  - content: |
         SELINUX=disabled
    owner: root:root
    path: /etc/sysconfig/selinux
    permissions: '0644'

timezone: ${time_zone}
