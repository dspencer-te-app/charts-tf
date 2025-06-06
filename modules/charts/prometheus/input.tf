variable "enabled" {
  type = bool
  default = true
}

variable "namespace" {
  description = "The namespace to install trivy in"
  type = string
  default = "default"
}

