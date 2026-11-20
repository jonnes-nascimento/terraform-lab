resource "local_file" "config" {
  filename = "${path.module}/config.txt"

  content = <<-EOT
    Project: Terraform Dependency Lab
    Environment: development
  EOT
}

resource "local_file" "summary" {
  filename = "${path.module}/summary.txt"

  content = <<-EOT
    Configuration file:
    ${local_file.config.filename}
  EOT
}

resource "local_file" "audit" {
  filename = "${path.module}/audit.txt"

  content = <<-EOT
    Audit record:
    Project initialization completed.
  EOT

  depends_on = [
    local_file.config
  ]
}