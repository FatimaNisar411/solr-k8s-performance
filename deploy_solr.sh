#!/bin/bash

set -e

echo "🔧 Adding Bitnami Helm repository..."
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update

echo "🚀 Installing Solr from Bitnami Helm chart..."
helm upgrade my-solr bitnami/solr

echo "⏳ Waiting for Solr pods to initialize (60s)..."
sleep 60

echo "🔍 Fetching Solr admin credentials..."
USERNAME="admin"
PASSWORD=$(kubectl get secret --namespace default my-solr -o jsonpath="{.data.solr-password}" | base64 -d)

echo "👤 Username: $USERNAME"
echo "🔐 Password: $PASSWORD"

echo "🌐 Starting port-forwarding to Solr on localhost:8983..."
kubectl port-forward --namespace default svc/my-solr 8983:8983 &

echo ""
echo "✅ Solr should now be accessible at: http://localhost:8983/solr"
echo "📢 Use the credentials above to log in."
