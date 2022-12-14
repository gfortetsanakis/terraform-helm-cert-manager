# Terraform module for cert-manager

This module deploys the following helm chart on a kubernetes cluster:

| Name         | Repository                 | Version |
| ------------ | -------------------------- | ------- |
| cert-manager | https://charts.jetstack.io | v1.9.1  |

The cert-manager service can be used for automatically issuing certificates for new applications that are deployed to the cluster. Specifically, the module creates a ClusterIssuer that is responsible for issuing certificates for all namespaces. 

## Module input parameters

| Parameter          | Type     | Description                                                                                   |
| ------------------ | -------- | --------------------------------------------------------------------------------------------- |
| namespace          | Required | The kubernetes namespace at which the cert-manager chart will be deployed                     |
| ca_key             | Required | The private key of the ClusterIssuer certificate authority                                    |
| ca_crt             | Required | The certificate of the ClusterIssuer certificate authority                                    |
| certificate_issuer | Optional | The name of the ClusterIssuer to be created                                                   |
| node_selector      | Optional | A map variable with nodeSelector labels applied when placing pods of the chart on the cluster |

## Module output parameters

| Parameter      | Description                                           |
| -------------- | ----------------------------------------------------- |
| cluster_issuer | The name of the ClusterIssuer created by cert-manager |