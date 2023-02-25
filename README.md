hetzner-dyndns-docker
=====================

Dockerfile and Ansible playbooks to update DNS entry on Hetzner grapped from Fritzbox.

The docker container executes the playbook every 5 minutes.

Build
-----

`docker build . -t hetzner-dyndns --network host`

Prepare
-------

1. Login to Fritzbox
2. Go to **Heimnetz** | **Netzwerk** | **Netzwerkeinstellungen**
3. Enable **Statusinformationen über UPnP übertragen** (if not already enabled)

Run
---

`docker run -e "DNS_ZONE=<DOMAIN>" -e "API_KEY=<API-KEY>" hetzner-dyndns`

Credits
-------

Playbooks based on previous work from P. Haberkern (thedatabaseme) with the following adjustments:
* Fritzbox UPNP interface does not need username/password
* Don't update the record if the IP has not changed
* Set TTL for DNS entry to 60 seconds instead of 24 hours
