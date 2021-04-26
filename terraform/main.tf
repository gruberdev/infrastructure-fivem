resource "vultr_ssh_key" "my_user" {
  name    = "Root SSH key"
  ssh_key = file("resources/sshkey.pub")
}

resource "vultr_startup_script" "startup" {
  name   = "boot_script"
  script = filebase64("resources/boot_script.sh")
  type   = "boot"
}

resource "vultr_private_network" "internal" {
  description    = "Private Network for you Vultr"
  region         = var.region
  v4_subnet      = var.subnet
  v4_subnet_mask = var.subnet_mask
}

resource "vultr_instance" "fivem" {
  plan                = var.plan
  region              = var.region
  os_id               = var.os
  label               = var.label
  hostname            = var.hostname
  ssh_key_ids         = [vultr_ssh_key.my_user.id]
  private_network_ids = [vultr_private_network.internal.id]
  script_id           = vultr_startup_script.startup.id
  firewall_group_id   = vultr_firewall_group.my_firewall_grp.id


  depends_on = [
    vultr_firewall_rule.allow_http,
    vultr_firewall_rule.allow_ssh,
    vultr_firewall_rule.allow_https,
    vultr_firewall_group.my_firewall_grp,
    vultr_firewall_rule.allow_tcp_120,
    vultr_firewall_rule.allow_udp_120,
    vultr_firewall_rule.allow_tcp_110,
    vultr_firewall_rule.allow_udp_110,
  ]
  provisioner "file" {
    source      = "resources/proxy/default.conf.template"
    destination = "/tmp/default.conf.template"
    connection {
      type     = "ssh"
      user     = "root"
      host     = self.main_ip
      password = self.default_password
    }
  }
  provisioner "file" {
    source      = "resources/proxy/dockerfile"
    destination = "/tmp/Dockerfile"
    connection {
      type     = "ssh"
      user     = "root"
      host     = self.main_ip
      password = self.default_password
    }
  }
  provisioner "file" {
    source      = "resources/proxy/docker-compose.yml"
    destination = "/tmp/docker-compose.yml"
    connection {
      type     = "ssh"
      user     = "root"
      host     = self.main_ip
      password = self.default_password
    }
  }
  provisioner "file" {
    source      = "resources/proxy/entrypoint.sh"
    destination = "/tmp/entrypoint.sh"
    connection {
      type     = "ssh"
      user     = "root"
      host     = self.main_ip
      password = self.default_password
    }
  }
  provisioner "file" {
    source      = "resources/proxy/stream.conf.template"
    destination = "/tmp/stream.conf.template"
    connection {
      type     = "ssh"
      user     = "root"
      host     = self.main_ip
      password = self.default_password
    }
  }
  provisioner "file" {
    source      = "resources/start.sh"
    destination = "/tmp/start.sh"
    connection {
      type     = "ssh"
      user     = "root"
      host     = self.main_ip
      password = self.default_password
    }
  }
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/entrypoint.sh",
      "chmod +x /tmp/start.sh",
      "export TAILSCALE_IP=${var.tailscale_local}",
      "export TAILSCALE_TOKEN=${var.tailscale_token}",
      "sh /tmp/start.sh",
      "exit 0"
    ]
    connection {
      type     = "ssh"
      user     = "root"
      host     = self.main_ip
      password = self.default_password
    }
  }
}

resource "cloudflare_record" "public" {
  zone_id = var.zone_id
  name    = var.hostname
  value   = vultr_instance.fivem.main_ip
  type    = var.domain_type
  ttl     = var.ttl
  proxied = false


  depends_on = [
    vultr_firewall_rule.allow_http,
    vultr_firewall_rule.allow_ssh,
    vultr_firewall_rule.allow_https,
    vultr_firewall_group.my_firewall_grp,
  ]
}

