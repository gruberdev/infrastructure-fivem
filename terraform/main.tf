
resource "vultr_instance" "fivem" {
  plan              = var.plan
  region            = var.region
  os_id             = var.os
  label             = var.label
  hostname          = var.hostname
  ssh_key_ids       = [vultr_ssh_key.my_user.id]
  script_id         = vultr_startup_script.startup.id
  firewall_group_id = vultr_firewall_group.my_firewall_grp.id


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
}
resource "vultr_ssh_key" "my_user" {
  name    = "Root SSH key"
  ssh_key = file("sshkey.pub")
}

resource "vultr_startup_script" "startup" {
  name   = "boot_script"
  script = filebase64("boot_script.sh")
  type   = "boot"
}

resource "cloudflare_record" "public" {
  zone_id = var.zone_id
  name    = var.hostname
  value   = vultr_instance.fivem.main_ip
  type    = var.domain_type
  ttl     = var.ttl
  proxied = true


  depends_on = [
    vultr_firewall_rule.allow_http,
    vultr_firewall_rule.allow_ssh,
    vultr_firewall_rule.allow_https,
    vultr_firewall_group.my_firewall_grp,
  ]
}
