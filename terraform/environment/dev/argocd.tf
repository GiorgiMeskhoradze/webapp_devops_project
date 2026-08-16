resource "helm_release" "argocd" {
  name             = "argocd"
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  version          = "7.7.11"  # pinned version, upgrade deliberately later
  namespace        = "argocd"
  create_namespace = true

  values = [
    file("${path.module}/argocd-values.yaml")
  ]
}