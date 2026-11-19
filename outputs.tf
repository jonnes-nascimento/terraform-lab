
output "development_file" {
  description = "Arquivo gerado para development"
  value       = module.development.file_path
}

output "testing_file" {
  description = "Arquivo gerado para testing"
  value       = module.testing.file_path
}

output "production_file" {
  description = "Arquivo gerado para production"
  value       = module.production.file_path
}

output "development_content" {
  value = module.development.file_content
}

output "testing_content" {
  value = module.testing.file_content
}

output "production_content" {
  value = module.production.file_content
}