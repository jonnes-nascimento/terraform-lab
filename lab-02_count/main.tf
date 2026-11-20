terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

resource "local_file" "environment" {
  count = length(var.environments)

  filename = "${path.module}/${var.environments[count.index]}.txt"

  content = <<-EOT
    Project: Terraform Count Lab
    Environment Index: ${var.environments[count.index]}
  EOT
}