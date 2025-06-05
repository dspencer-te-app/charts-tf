variable "namespace" {
  type        = string
  description = "Namespace, which could be your organization name or abbreviation, e.g. 'eg' or 'cp' or 'cp-eg'"
  default     = "teomega"
}

variable "stage" {
  type        = string
  description = "Stage, e.g. 'prod', 'staging', 'dev'"
  default     = "dev"
}

variable "name" {
  type        = string
  description = "Name, e.g. 'app' or 'cluster'"
  default     = "k8s"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID"
  default     = "vpc-0f003548c7490321a"
}

variable "vpn_gateway_amazon_side_asn" {
  type        = number
  description = "Amazon side ASN for the VPN gateway"
  default     = 64512
}

variable "customer_gateway_bgp_asn" {
  type        = number
  description = "BGP ASN for the customer gateway"
  default     = 65000
}

variable "customer_gateway_ip_address" {
  type        = string
  description = "IP address for the customer gateway"
  default     = "172.0.0.1"
}

variable "route_table_ids" {
  type        = list(string)
  description = "List of route table IDs"
  default     = ["rtb-033b6d4315ef65b26", "rtb-0667ceb28413a32b7","rtb-0e48b4d75210191dd"]
}

variable "vpn_connection_static_routes_only" {
  type        = bool
  description = "Whether to use static routes only"
  default     = true
}

variable "vpn_connection_static_routes_destinations" {
  type        = list(string)
  description = "List of static route destinations"
  default     = ["10.80.1.0/24"]
}

variable "vpn_connection_log_retention_in_days" {
  type        = number
  description = "Retention period for VPN connection logs in days"
  default     = 365
}
