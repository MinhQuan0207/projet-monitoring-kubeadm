# Projet Monitoring Kubernetes (Kubeadm)

Ce projet déploie une stack de monitoring complète (Prometheus, Grafana, SNMP Exporter) sur un cluster Kubernetes auto-hébergé chez DigitalOcean.

## Architecture
- **Cluster** : Installé via `kubeadm` sur Debian 12.
- **Réseau** : Calico (CNI) + DigitalOcean Cloud Controller Manager (CCM).
- **Stockage** : Persistent Volumes (PV) locaux.
- **Accès Externe** : Ingress NGINX + LoadBalancer DigitalOcean.

## Contenu du dépôt
* `00-namespace.yaml` : Création de l'espace de travail.
* `01-roles.yaml` : Permissions RBAC pour Prometheus.
* `02-configmaps.yaml` : Configuration de Prometheus et des alertes.
* `03-prometheus-deployment.yaml` : Déploiement du serveur Prometheus.
* `04-grafana-deployment.yaml` : Déploiement de l'interface Grafana.
* `05-snmp-exporter.yaml` : Collecteur de métriques SNMP (pour routeurs).
* `08-ingress-complete.yaml` : Règles de routage (fqdn: mqmqmqmq.duckdns.org).
* `ccm-do.yaml` : Configuration du Cloud Controller DigitalOcean.

## Installation
1. Appliquer les manifestes :
   ```bash
   kubectl apply -f .
