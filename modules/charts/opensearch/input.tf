variable "enabled" {
  description = "Whether to enable opensearch"
  type = bool
  default = true
}

variable "namespace" {
  description = "The namespace to install opensearch in"
  type = string
  default = "opensearch"
}

variable "admin_password" {
  description = "Default Admin Password"
  type = string
  default = "SuperSecretR0d3nt"
}
