variable "environments" {
  # exemplo usando map
  #    type = map(string)

  #default = {
  #development = "Development environment generated!"
  #testing = "Testing environment generated!"
  #production = "Production environment generated!"
  #}

  # exemplo usando set
  type = set(string)

  default = [
    "development",
    #    "testing",
    "homologation",
    "production"
  ]
}