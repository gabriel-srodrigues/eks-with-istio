resource "helm_release" "metrics_server" {
    name        = "metrics-server"
    repository  = "https://charts.bitnami.com/bitnami" 
    chart       = "metrics-server"
    namespace   = "kube-system"
    
    set {
        name  = "apiService.create"
        value = "true"
    }

    depends_on = [
        aws_eks_cluster.eks_cluster
    ]    
}