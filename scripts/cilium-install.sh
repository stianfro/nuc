#!/bin/bash

CURRENT_CONTEXT=$(kubectl config current-context)

if [ "$CURRENT_CONTEXT" != "nuc" ]; then
	echo "Current context is not 'nuc'. Exiting..."
	exit 1
fi

if [ -z "${SERVER_IP}" ]; then
	echo "Environment variable SERVER_IP is not set."
	exit 1
fi

cilium install --version 1.15.1 \
	--set=ipam.operator.clusterPoolIPv4PodCIDRList="10.42.0.0/16" \
	--set=l2announcements.enabled=true \
	--set=externalIPs.enabled=true \
	--set=kubeProxyReplacement=true \
	--set=k8sServiceHost="${SERVER_IP}" \
	--set=k8sServicePort=6443 \
	--set=hubble.enabled=true \
	--set=hubble.ui.enabled=true \
	--set=hubble.relay.enabled=true
