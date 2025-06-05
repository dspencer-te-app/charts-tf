resource "aws_opensearch_domain" "opensearch" {
  domain_name           = var.domain_name
  engine_version        = var.engine_version
  cluster_config {
    instance_type       = var.instance_type
    instance_count      = var.instance_count
    dedicated_master_enabled = lookup(var.elasticsearch_cluster_config, "dedicated_master_enabled", true)
    dedicated_master_count   = lookup(var.elasticsearch_cluster_config, "dedicated_master_count", 3)
    dedicated_master_type    = lookup(var.elasticsearch_cluster_config, "dedicated_master_type", "m5.large.search")
    warm_enabled              = lookup(var.elasticsearch_cluster_config, "warm_enabled", false)
    warm_count                = lookup(var.elasticsearch_cluster_config, "warm_count", null)
    warm_type                 = lookup(var.elasticsearch_cluster_config, "warm_type", null)
    warm_volume_size          = lookup(var.elasticsearch_cluster_config, "warm_volume_size", null)
    zone_awareness_enabled    = lookup(var.elasticsearch_cluster_config, "zone_awareness_enabled", false)
    dynamic "zone_awareness_config" {
      for_each = lookup(var.elasticsearch_cluster_config, "zone_awareness_enabled", false) ? [lookup(var.elasticsearch_cluster_config, "zone_awareness_config", {})] : []
      content {
        availability_zone_count = lookup(zone_awareness_config.value, "availability_zone_count", null)
      }
    }
  }

  log_publishing_options {
    cloudwatch_log_group_arn = aws_cloudwatch_log_group.example.arn
    log_type                 = "AUDIT_LOGS"
    enabled                  = true
  }

  vpc_options {
    subnet_ids         = var.vpc_options.subnet_ids
    security_group_ids = var.vpc_options.security_group_ids
  }

  node_to_node_encryption {
    enabled = var.node_to_node_encryption_enabled
  }

  encrypt_at_rest {
    enabled    = lookup(var.encrypt_at_rest_options, "enabled", true)
    kms_key_id = lookup(var.encrypt_at_rest_options, "kms_key_id", null)
  }

  domain_endpoint_options {
    enforce_https         = lookup(var.domain_endpoint_options, "enforce_https", true)
    tls_security_policy = lookup(var.domain_endpoint_options, "tls_security_policy", "Policy-Min-TLS-1-2-2019-07")
  }

  advanced_security_options {
    enabled                       = lookup(var.advanced_security_options, "enabled", false)
    internal_user_database_enabled = lookup(var.advanced_security_options, "internal_user_database_enabled", false)
    dynamic "master_user_options" {
      for_each = lookup(var.advanced_security_options, "internal_user_database_enabled", false) ? [lookup(var.advanced_security_options, "master_user_options", {})] : []
      content {
        master_user_name     = master_user_options.value.master_user_name
        master_user_password = master_user_options.value.master_user_password
      }
    }
  }

  access_policy = var.access_policy_json

  ebs_options {
    ebs_enabled           = true
    volume_type           = "gp2" # You can make this a variable if needed
    volume_size           = var.ebs_volume_size
  }

  tags = var.tags
}

resource "aws_opensearch_domain_policy" "default" {
  domain_name = aws_opensearch_domain.opensearch.domain_name
  access_policy = coalesce(var.access_policy_json, jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Principal = "*"
        Action   = "es:*"
        Resource = "${aws_opensearch_domain.opensearch.arn}/*"
      },
    ]
  }))
}

resource "aws_opensearch_domain_kibana" "kibana" {
  count       = var.kibana_enabled ? 1 : 0
  domain_name = aws_opensearch_domain.opensearch.domain_name
  subnet_ids  = coalesce(var.kibana_subnet_ids, var.vpc_options.subnet_ids)
  security_groups = coalesce(var.kibana_security_group_ids, var.vpc_options.security_group_ids)

  # You can configure more Kibana specific settings here if the provider supports them
}

output "opensearch_domain_endpoint" {
  description = "Endpoint of the OpenSearch Service domain"
  value       = aws_opensearch_domain.opensearch.endpoint
}

output "kibana_endpoint" {
  description = "Endpoint of the Kibana instance (if enabled)"
  value       = aws_opensearch_domain_kibana.kibana[0].endpoint
  sensitive   = true
}

output "opensearch_arn" {
  description = "ARN of the OpenSearch Service domain"
  value       = aws_opensearch_domain.opensearch.arn
}
