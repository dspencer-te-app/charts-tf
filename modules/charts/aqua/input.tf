variable "enabled" {
  description = "Whether to enable aqua trivy"
  type = bool
  default = true
}

variable "values" {
  description = "The input to pass to the trivy chart"
  type = list(string)
  default = []
}

variable "skip_crds" {
  description = "Whether to skip installing CRDs"
  type = bool
  default = false
}

variable "set" {
  description = "The set values to pass to the trivy chart"
  type = list(string)
  default = [
    "trivy.ignoreUnfixed=true"
  ]
}

variable "chart_version" {
  description = "The version of the trivy chart"
  type = string
  default = "latest"
}

variable "namespace" {
  description = "The namespace to install trivy in"
  type = string
  default = "trivy-system"
}

variable "repository" {
  description = "The repository to install trivy from"
  type = string
  default = "https://aquasecurity.github.io/helm-charts/"
}

variable "chart" {
  description = "The chart to install"
  type = string
  default = "aqua/trivy-operator"
}

