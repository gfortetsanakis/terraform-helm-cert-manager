variable "namespace" {
  description = "The kubernetes namespace at which the cert-manager chart will be deployed."
}

variable "ca_key" {
  description = "The path to the file containing the private key of the ClusterIssuer certificate authority."
}

variable "ca_crt" {
  description = "The path to the file containing the certificate of the ClusterIssuer certificate authority."
}

variable "cluster_issuer" {
  description = "The name of the ClusterIssuer to be created."
  default     = "cert-issuer"
}

variable "node_selector" {
  description = "A map variable with nodeSelector labels applied when placing pods of the chart on the cluster."
  default     = {}
}