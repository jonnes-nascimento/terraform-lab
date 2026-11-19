variable "project_name" {
  description = "Nome do projeto"
  type        = string
}

variable "environment" {
  description = "Ambiente de destino"
  type        = string
}

variable "message" {
  description = "Mensagem que sera gravada"
  type        = string
}

variable "output_directory" {
  description = "Diretorio de destino"
  type        = string
}