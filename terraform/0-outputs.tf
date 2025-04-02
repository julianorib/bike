output "eks-cluster-endpoint" {
  value = aws_eks_cluster.main.endpoint
}

output "eks-cluster-name"{
    value = aws_eks_cluster.main.name
}