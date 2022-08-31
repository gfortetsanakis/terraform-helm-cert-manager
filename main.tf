resource "kubernetes_secret" "ca-key-pair" {
  metadata {
    name      = "ca-key-pair"
    namespace = var.namespace
  }

  data = {
    "tls.crt" = file("${var.ca_crt}")
    "tls.key" = file("${var.ca_key}")
  }

  type = "kubernetes.io/tls"
}

resource "helm_release" "cert-manager" {
  chart      = "cert-manager"
  name       = "cert-manager"
  namespace  = var.namespace
  repository = "https://charts.jetstack.io"
  version    = "v1.9.1"
  wait       = true

  values = [
    templatefile("${path.module}/templates/cert-manager.yaml", {
      node_selector = var.node_selector
    })
  ]
}

resource "kubectl_manifest" "ca-issuer" {
  yaml_body = <<YAML
apiVersion: cert-manager.io/v1
kind: ClusterIssuer
metadata:
  name: ${var.cluster_issuer}
spec:
  ca:
    secretName: ca-key-pair
YAML

  depends_on = [helm_release.cert-manager, kubernetes_secret.ca-key-pair]
}