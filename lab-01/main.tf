terraform {
  required_version = ">= 1.0"

  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

provider "local" {}

module "development" {
  source = "./modules/file_generator"

  project_name     = var.project_name
  environment      = "development"
  message          = "Development environment generated!"
  output_directory = path.root
}

module "testing" {
  source = "./modules/file_generator"

  project_name     = var.project_name
  environment      = "testing"
  message          = "Testing environment generated!"
  output_directory = path.root
}

module "production" {
  source = "./modules/file_generator"

  project_name     = var.project_name
  environment      = "production"
  message          = "Production environment generated!"
  output_directory = path.root
}