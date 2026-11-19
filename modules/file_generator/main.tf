#    tipo do recurso - nome logico do recurso
resource "local_file" "generated" {
  filename = "${var.output_directory}/${var.environment}.txt"

  content = <<-EOT
    Project: ${var.project_name}
    Environment: ${var.environment}
    Message: ${var.message}
  EOT
}