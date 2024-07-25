#!/bin/bash
# Copyright (c) 2024 Ho Kim (ho.kim@ulagbulag.io). All rights reserved.
# Use of this source code is governed by a GPL-3-style license that can be
# found in the LICENSE file.
#
# More guide about NVIDIA Omniverse Farm: https://catalog.ngc.nvidia.com/orgs/nvidia/teams/omniverse/helm-charts/omniverse-farm

# Prehibit errors
set -e -o pipefail
# Verbose
set -x

###########################################################
#   Configuration                                         #
###########################################################

# Configure default environment variables
CONTAINER_REGISTRY_DEFAULT="omniverse-farm-registry"
HELM_CHART_DEFAULT="https://helm.ngc.nvidia.com/nvidia/omniverse/charts/omniverse-farm"
NAMESPACE_DEFAULT="name-twin"
VERSION_DEFAULT="1.0.0"

# Set environment variables
CONTAINER_REGISTRY="${CONTAINER_REGISTRY:-$CONTAINER_REGISTRY_DEFAULT}"
HELM_CHART="${HELM_CHART:-$HELM_CHART_DEFAULT}"
NAMESPACE="${NAMESPACE:-$NAMESPACE_DEFAULT}"
VERSION="${VERSION:-$VERSION_DEFAULT}"

###########################################################
#   Configure Container Registry                          #
###########################################################

echo "- Configuring container registry ... "

kubectl get secret "${CONTAINER_REGISTRY}" \
    --namespace "${NAMESPACE}" >/dev/null ||
    kubectl create secret docker-registry \
        "${CONTAINER_REGISTRY}" \
        --namespace "${NAMESPACE}" \
        --docker-server="nvcr.io" \
        --docker-username='$oauthtoken' \
        --docker-password="${NGC_CLI_API_KEY}"

###########################################################
#   Configure Helm Chart                                  #
###########################################################

echo "- Configuring Helm chart ... "

helm fetch "${HELM_CHART}-${VERSION}.tgz" \
    --username='$oauthtoken' \
    --password="${NGC_CLI_API_KEY}"

###########################################################
#   Install Operator                                      #
###########################################################

echo "- Installing Operator ... "

helm upgrade --install "omniverse-farm" \
    "./omniverse-farm-${VERSION}.tgz" \
    --create-namespace \
    --namespace "${NAMESPACE}" \
    --set global.imagePullSecrets[0].name="${CONTAINER_REGISTRY}" \
    --values "./values.yaml"

# Finished!
echo "Installed!"
