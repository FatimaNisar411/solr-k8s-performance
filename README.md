# solr-k8s-performance

## Overview
This project deploys **Apache Solr** on Kubernetes and configures **Horizontal Pod Autoscaling (HPA)** to manage scalability based on CPU usage.

## Key Features
- **Solr Deployment**: Solr is deployed using Helm for ease of management.
- **Autoscaling**: Horizontal Pod Autoscaler (HPA) is applied to automatically scale Solr based on CPU utilization, with a minimum of 1 pod and a maximum of 5.
- **Metrics Server**: Installed for collecting metrics required for autoscaling.
- **Solr Admin Access**: The Solr admin interface is accessible locally via port-forwarding.

## Files
- `deploy_solr.sh`: Script for automating the deployment of Solr on Kubernetes using Helm.
- `autoscale-solr.sh`: Script that installs the Metrics Server, sets up HPA, and facilitates port-forwarding to Solr.

## Testing and Verification
- **Solr Access**: After deployment, Solr can be accessed via `http://localhost:8983/solr`.
- **Autoscaling**: HPA is configured with a CPU target of 50%, ensuring dynamic scaling as the load increases or decreases.
