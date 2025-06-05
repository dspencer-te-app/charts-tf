variable "enabled" {
  description = "Whether to enable fluxcd"
  type = bool
  default = true
}

variable "values" {
  description = "The input to pass to the fluxcd chart"
  type = list(string)
  default = []
}

variable "skip_crds" {
  description = "Whether to skip installing CRDs"
  type = bool
  default = false
}

variable "set" {
  description = "The set values to pass to the fluxcd chart"
  type = list(string)
  default = []
}

variable "chart_version" {
  description = "The version of the fluxcd chart"
  type = string
  default = "latest"
}

variable "namespace" {
  description = "The namespace to install fluxcd in"
  type = string
  default = "fluxcd-community/Flux"
}

variable "repository" {
  description = "The repository to install fluxcd from"
  type = string
  default = "https://fluxcd-community.github.io/helm-charts"
}

variable "chart" {
  description = "The chart to install"
  type = string
  default = "flux-system"
}

