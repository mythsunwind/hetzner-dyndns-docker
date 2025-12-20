#!/bin/sh

if [ -z "$DNS_ZONE" ]; then
	echo "Environment variable DNS_ZONE not set"
	exit 1
fi

if [ -z "$API_KEY" ]; then
	echo "Environment variable API_KEY not set"
	exit 1
fi

while true; do
       ansible-playbook main.yml -e "dns_zone=$DNS_ZONE api_key=$API_KEY ipv6_identifier=$IPV6_IDENTIFIER" -e '{ "dyndns_names":["dyn"] }' -k -K
       sleep 300
done
