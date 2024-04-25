#!/bin/bash

if [ -z "${SERVER_IP}" ]; then
	echo "Environment variable SERVER_IP is not set."
	exit 1
fi

if [ -z "${AGENT_IP}" ]; then
	echo "Environment variable AGENT_IP is not set."
	exit 1
fi

k3sup join --host "${AGENT_IP}" \
	--server-host "${SERVER_IP}" \
	--user stianfroystein
