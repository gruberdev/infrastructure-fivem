terraform {
  required_version = ">= 0.13"
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 2.0"
    }
    vultr = {
      source  = "vultr/vultr"
      version = "2.2.0"
    }
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.11.0"
    }
    null = {
      source  = "hashicorp/null"
      version = "3.1.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.1.0"
    }
  }
}

provider "vultr" {
  api_key     = var.vultr_token
  rate_limit  = 650
  retry_limit = 5
}

provider "cloudflare" {
  email   = var.cloudflare_email
  api_key = var.cloudflare_api_key
}

