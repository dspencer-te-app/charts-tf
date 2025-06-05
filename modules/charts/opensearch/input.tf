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
