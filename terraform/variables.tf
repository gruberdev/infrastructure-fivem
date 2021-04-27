variable "zone_id" {
  description = "Cloudflare Zone ID Number"
  type        = string
}

variable "cloudflare_email" {
  description = "Cloudflare Zone ID Number"
  type        = string
}

variable "cloudflare_api_key" {
  description = "Cloudflare Zone ID Number"
  type        = string
}

variable "vultr_token" {
  description = "Vultr API token"
  type        = string
}

variable "os" {
  description = "Vultr OS"
  default     = 244
}

variable "plan" {
  description = "Vultr Plan"
  type        = string
}

variable "label" {
  description = "Vultr Server Name Labeling"
  type        = string
}

variable "region" {
  description = "Vultr Region"
  type        = string
}

variable "hostname" {
  description = "Vultr instance Resource hostname"
  type        = string
}


variable "domain_type" {
  description = "Cloudflare Type of Domain Name Record Entry"
  type        = string
}

variable "ttl" {
  description = "Cloudflare Record TTL number"
  type        = string
}

variable "subnet" {
  description = "Vultr Private Network subnet for instances. Cannot overlap Cluster Service IP's(10.96.0.0/12) or Pod Network IPs(10.244.0.0/16)."
  type        = string
  default     = "10.240.0.0"
}
variable "subnet_mask" {
  description = "subnet mask for Vultr Network Instance"
  type        = number
  default     = 24
}

variable "tailscale_local" {
  description = "Your local tailscale local IPv4 for bridging"
  type        = string
}

variable "tailscale_token" {
  description = "Your Tailscale reusable API Token"
  type        = string
}
