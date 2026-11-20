terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

resource "local_file" "environment" {
  for_each = var.environments

  filename = "${path.module}/${each.key}.txt"

  # exemplo usando map
  #  content = <<-EOT
  #Project: Terraform For Each Lab
  #Environment: ${each.key}
  #Message: ${each.value}
  #EOT

  # exemplo usando set
  content = "Environment: ${each.key}"
}