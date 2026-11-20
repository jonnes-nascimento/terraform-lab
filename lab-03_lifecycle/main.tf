terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

#resource "local_file" "application" {
  #filename = "${path.module}/application-v2.txt"

  #content = "Application version 2"

##  lifecycle {
    ##create_before_destroy = true
  ##}

  #lifecycle {
    #prevent_destroy = true
  #}
#}

resource "local_file" "configuration" {
  filename = "${path.module}/configuration.txt"

  content = "Original configuration"

  lifecycle {
    ignore_changes = [
      content
    ]
  }
}