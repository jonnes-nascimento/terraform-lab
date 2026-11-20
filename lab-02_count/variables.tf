variable "environments" {
  type = list(string)
  default = [
    "development",
    "testing",
    "homologation",
    "production"
  ]
}