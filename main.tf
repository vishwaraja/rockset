provider "kubernetes" {

  host                   = module.eks.cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
#   token                  = data.aws_eks_cluster_auth.cluster.token
  config_path    = "~/.kube/config"

}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}


data "aws_availability_zones" "available" {}

locals {
  cluster_name = "rockset-cluster"
}

resource "random_string" "suffix" {
  length  = 8
  special = false
}