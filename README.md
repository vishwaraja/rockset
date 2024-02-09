# Rockset EKS cluster with Nginx

This documentation talks about setting up an aws environment to deploy a nginx deployment to a kubernetes cluster. This involves setting up of various components.

The documentation requires the below components to be pre-installed.
* aws-cli
* kubctl
* terraform

The installation steps consists of two folds they are:

      1. EKS cluster and VPC setup (using terraform)
      2. nginx deployment (using kubectl)

## 1. EKS cluster and  VPC setup (using terraform)

The steps involved to set this up are:


	  git clone <url link>
	  cd rockset
	  export AWS_ACCESS_KEY_ID=<>
	  export AWS_SECRET_ACCESS_KEY=<>
	  export AWS_DEFAULT_REGION=<>
	  terraform init
	  terraform plan
	  terraform apply

Also if you have a different default kube config location please make the change to the `config_path` in the main.tf file under the kubernetes provider block:

    provider "kubernetes" {

      host                   = module.eks.cluster_endpoint
      cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
      #   token                  = data.aws_eks_cluster_auth.cluster.token
      config_path             = "~/.kube/config"

    }

## 2. Nginx deployment (using kubectl)

The steps involved to set this up are:

	  git clone <url link>
	  cd rockset/nginx
	  kubectl apply -f nginx.yml


To get the load balancer url do:

    kubectl get svc

This should be a sammple output:


    NAME            TYPE           CLUSTER-IP       EXTERNAL-IP                                                              PORT(S)        AGE
    kubernetes      ClusterIP      172.20.0.1       <none>                                                                   443/TCP        130m
    nginx-service   LoadBalancer   172.20.201.100   a5407941055fe4e9cb6190644660c97a-147978755.us-east-2.elb.amazonaws.com   80:31494/TCP   41m


Use the url of the nginx-service to view the status page.




The config-map section in the nginx.yml file can be tweaked to return any kind of response required when hitting "/" in the url.
