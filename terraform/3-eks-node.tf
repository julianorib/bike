# resource "aws_eks_node_group" "main" {
#   cluster_name    = aws_eks_cluster.main.name
#   node_group_name = format("%s-eks-cluster-nodes", var.project_name)
#   node_role_arn   = aws_iam_role.node.arn
#   subnet_ids      = [
#       aws_subnet.private-1a.id,
#       aws_subnet.private-1b.id,
#       aws_subnet.private-1c.id,
#     ]

#   scaling_config {
#     desired_size = 2
#     max_size     = 3
#     min_size     = 1
#   }

#   update_config {
#     max_unavailable = 1
#   }

#   depends_on = [
#     aws_iam_role_policy_attachment.node_AmazonEKSWorkerNodePolicy,
#     aws_iam_role_policy_attachment.node_AmazonEKS_CNI_Policy,
#     aws_iam_role_policy_attachment.node_AmazonEC2ContainerRegistryReadOnly,
#   ]
# }

