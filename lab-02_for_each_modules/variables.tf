variable "environments" {
  type = map(string)

  default = {
    development = "Development environment generated!"
    testing     = "Testing environment generated!"
    production  = "Production environment generated!"
  }
}