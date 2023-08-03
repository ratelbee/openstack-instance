#cloud-config

packages:
  - vim
  - curl
  - docker
  - docker.io
  - docker-compose
  - jq
  - mutt
  - tree

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

timezone: ${time_zone}

runcmd:
  - usermod -aG docker ${admin}
