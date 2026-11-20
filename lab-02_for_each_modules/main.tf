module "environment" {
  source = "../lab-01_modules/modules/file_generator"

  for_each = var.environments

  project_name = "Terraform Modular Lab"
  environment  = each.key
  message      = each.value

  output_directory = "${path.module}/output"
}