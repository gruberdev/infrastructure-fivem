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
  type        = string
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

