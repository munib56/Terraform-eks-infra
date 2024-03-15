resource "aws_iam_role" "eks-cluster" {
  name = "eks-cluster-${var.cluster_name}"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
            Service = "eks.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "Amazom-EKS-Cluster-Policy" {
  policy_arn = "arn:aws:iam:policy/AmazonEKSCLusterPolicy"
  role = aws_iam_role.eks-cluster.name
}

resource "aws_eks_cluster" "cluster" {
  name = var.cluster_name
  version = var.cluster_version
  role_arn = aws_iam_role.eks-cluster.arn

  vpc_config {
    endpoint_private_access = false
    endpoint_public_access = true
    public_access_cidrs = ["0.0.0.0/0"]

    subnet_ids = [
      aws_subnet.private-ap-south-1a.id,
      aws_subnet.private-ap-south-1b.id,
      aws_subnet.public-ap-south-1a.id,
      aws_subnet.public-ap-south-1b.id    
    ]
  }
  depends_on = [ aws_iam_role_policy_attachment.Amazom-EKS-Cluster-Policy ]
}
