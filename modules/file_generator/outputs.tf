output "file_path" {
  description = "Caminho do arquivo gerado"
  value       = local_file.generated.filename
}

output "file_id" {
  description = "Identificador do arquivo"
  value       = local_file.generated.id
}

output "file_content" {
  description = "Conteudo do arquivo"
  value       = local_file.generated.content
}