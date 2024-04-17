#!/bin/bash

if [ -z "${SERVER_IP}" ]; then
	echo "Environment variable SERVER_IP is not set."
	exit 1
fi

k3sup install --host "${SERVER_IP}" \
	--user stianfroystein \
	--local-path "${HOME}/.kube/config.d/nuc" \
	--context "nuc" \
	--k3s-extra-args="--flannel-backend=none --disable-network-policy --disable=traefik --disable-kube-proxy --disable=servicelb"
