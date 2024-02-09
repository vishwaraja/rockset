output "cluster_endpoint" {
  description = "Endpoint for EKS control plane"
  value       = module.eks.cluster_endpoint
}

output "cluster_security_group_id" {
  description = "Security group ids attached to the cluster control plane"
  value       = module.eks.cluster_security_group_id
}

output "region" {
  description = "AWS region"
  value       = var.region
}

output "cluster_name" {
  description = "Kubernetes Cluster Name"
  value       = module.eks.cluster_name
}


output "cluster_id"{
  description = "Kubernetes Cluster Id"
  value = module.eks.cluster_id
}

# output "load_balancer_hostname" {
#   value = kubernetes_ingress_v1.ingress.status.0.load_balancer.0.ingress.0.hostname
# }
#
# output "load_balancer_ip" {
#   value = kubernetes_ingress_v1.ingress.status.0.load_balancer.0.ingress.0.ip
# }