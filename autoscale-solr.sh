#!/bin/bash

set -e

echo "📦 Installing Metrics Server..."
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml

echo "⏳ Waiting 30 seconds for Metrics Server to initialize..."
sleep 30

echo "📊 Applying Horizontal Pod Autoscaler to the my-solr StatefulSet..."
kubectl autoscale statefulset my-solr --cpu-percent=50 --min=1 --max=5

echo "🔐 Fetching Solr admin credentials..."
USERNAME="admin"
PASSWORD=$(kubectl get secret --namespace default my-solr -o jsonpath="{.data.solr-password}" | base64 -d)

echo "👤 Username: $USERNAME"
echo "🔑 Password: $PASSWORD"

echo ""
echo "✅ Solr is accessible at: http://localhost:8983/solr"
echo "📢 Use the credentials above to log in."
echo "📈 Autoscaler applied with CPU target 50%, min pods 1, max pods 5."

