#!/bin/bash
set -e

echo "🚀 Initialisation kubeadm + Calico..."

sudo kubeadm init --config cluster/02-kubeadm-config.yaml

mkdir -p $HOME/.kube
sudo cp -f /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

kubectl cluster-info
kubectl get nodes

# Calico CNI
kubectl apply -f https://raw.githubusercontent.com/projectcalico/calico/master/manifests/calico.yaml

kubectl wait --for=condition=Ready nodes --all --timeout=300s

kubectl taint nodes --all node-role.kubernetes.io/control-plane- || true

echo "✅ Cluster OK !"
kubectl get nodes
kubectl get pods -A
