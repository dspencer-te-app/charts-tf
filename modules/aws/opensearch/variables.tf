variable "domain_name" {
  type        = string
  description = "Name of the OpenSearch Service domain"
}

variable "instance_type" {
  type        = string
  description = "Instance type for the OpenSearch nodes"
  default     = "r5.large.search"
}

variable "instance_count" {
  type        = number
  description = "Number of data nodes in the OpenSearch domain"
  default     = 3
}

variable "ebs_volume_size" {
  type        = number
  description = "Size of the EBS volume (in GiB) for each data node"
  default     = 100
}

variable "engine_version" {
  type        = string
  description = "Version of the OpenSearch engine"
  default     = "OpenSearch_2.11"
}

variable "vpc_options" {
  type = object({
    subnet_ids         = list(string)
    security_group_ids = list(string)
  })
  description = "VPC options for the OpenSearch domain"
}

variable "elasticsearch_cluster_config" {
  type = object({
    dedicated_master_enabled    = optional(bool, true)
    dedicated_master_count      = optional(number, 3)
    dedicated_master_type       = optional(string, "m5.large.search")
    warm_enabled                = optional(bool, false)
    warm_count                  = optional(number)
    warm_type                   = optional(string)
    warm_volume_size            = optional(number)
    zone_awareness_enabled      = optional(bool, false)
    zone_awareness_config       = optional(object({ availability_zone_count = number }))
  })
  description = "Elasticsearch cluster configuration"
  default = {}
}

variable "node_to_node_encryption_enabled" {
  type        = bool
  description = "Whether to enable node-to-node encryption"
  default     = true
}

variable "encrypt_at_rest_options" {
  type = object({
    enabled    = optional(bool, true)
    kms_key_id = optional(string) # Optional KMS key ARN
  })
  description = "Encrypt at rest options"
  default = {}
}

variable "domain_endpoint_options" {
  type = object({
    enforce_https         = optional(bool, true)
    tls_security_policy = optional(string, "Policy-Min-TLS-1-2-2019-07")
  })
  description = "Domain endpoint options"
  default = {}
}

variable "advanced_security_options" {
  type = object({
    enabled                       = optional(bool, false)
    internal_user_database_enabled = optional(bool, false)
    master_user_options           = optional(object({
      master_user_name     = string
      master_user_password = string
    }))
  })
  description = "Advanced security options"
  default = {}
}

variable "access_policy_json" {
  type        = string
  description = "JSON formatted access policy for the OpenSearch domain"
  default     = ""
}

variable "kibana_enabled" {
  type        = bool
  description = "Whether to enable the AWS managed Kibana"
  default     = true
}

variable "kibana_subnet_ids" {
  type        = optional(list(string))
  description = "Subnet IDs for the Kibana endpoint (if different from OpenSearch)"
  default     = null
}

variable "kibana_security_group_ids" {
  type        = optional(list(string))
  description = "Security Group IDs for the Kibana endpoint (if different from OpenSearch)"
  default     = null
}

variable "tags" {
  type        = map(string)
  description = "A map of tags to assign to the OpenSearch domain"
  default     = {}
}

variable "aws_region" {
  type        = string
  description = "AWS region to deploy the OpenSearch domain"
}
