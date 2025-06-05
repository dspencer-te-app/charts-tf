variable "enabled" {
  description = "Whether to enable flagger"
  type = bool
  default = true
}

variable "values" {
  description = "The input to pass to the flagger chart"
  type = list(string)
  default = [
  ]
}

variable "skip_crds" {
  description = "Whether to skip installing CRDs"
  type = bool
  default = false
}

variable "set" {
  description = "The set values to pass to the fluxcd chart"
  type = list(string)
  default = [
    "prometheus.install=true",
    "meshProvider=traefik"
  ]
}

variable "chart_version" {
  description = "The version of the fluxcd chart"
  type = string
  default = "latest"
}

variable "namespace" {
  description = "The namespace to install flagger in"
  type = string
  default = "traefik"
}

variable "repository" {
  description = "The repository to install flagger from"
  type = string
  default = "https://flagger.app"
}

variable "chart" {
  description = "The chart to install"
  type = string
  default = "flagger/flagger"
}

