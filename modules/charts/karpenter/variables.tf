variable "cluster_name" {
  description = "The name of the EKS cluster"
  type = string
  default = "teomega-k8s-dev"
}

variable "cluster_endpoint" {
  description = "The endpoint of the EKS cluster"
  type = string
  default = "https://.....eks.amazonaws.com"
}

variable "karpenter_iam_role_arn" {
  description = "The ARN of the Karpenter IAM role"
  type = string
  default = "arn:aws:iam::123456789012:role/KarpenterNodeInstanceProfile-teomega-k8s-dev"
}

variable "chart_version" {
  description = "The version of the Karpenter chart"
  type = string
  default = "latest"
}

variable "namespace" {
  description = "The namespace to install Karpenter in"
  type = string
  default = "karpenter/karpenter"
}

variable "enabled" {
  description = "Whether to enable Karpenter"
  type = bool
  default = true
}

variable "values" {
  description = "The values to pass to the Karpenter chart"
  type = list(string)
  default = []
}

variable "skip_crds" {
  description = "Whether to skip installing CRDs"
  type = bool
  default = false
}

variable "set" {
  description = "The set values to pass to the Karpenter chart"
  type = list(string)
  default = []
}

variable "repository" {
  description = "The repository to install Karpenter from"
  type = string
  default =  "https://charts.karpenter.sh/"
}
