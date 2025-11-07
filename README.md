hetzner-dyndns-docker
=====================

Dockerfile and Ansible playbooks to update DNS entry on Hetzner grapped from Fritzbox.

The docker container executes the playbook every 5 minutes.

⚠️ **This code does use the new Hetzner Cloud API** ⚠️

It does not work anymore if you have not migrate your DNS entries to Hetzner Console. Keep in mind that
you have to generate a new API token in Hetzner Console after migrating the DNS entries.

Prepare
-------

1. Login to Fritzbox
2. Go to **Heimnetz** | **Netzwerk** | **Netzwerkeinstellungen**
3. Enable **Statusinformationen über UPnP übertragen** (if not already enabled)

Get docker image
----------------

    docker pull ghcr.io/mythsunwind/hetzner-dyndns-docker:2.0

Run
---

    docker run -e "DNS_ZONE=<DOMAIN>" -e "API_KEY=<API-KEY>" ghcr.io/mythsunwind/hetzner-dyndns-docker

Optional: Build image yourself
-------------------------------

    docker build . -t hetzner-dyndns --network host

Credits
-------

Playbooks based on previous work from P. Haberkern (thedatabaseme) with the following adjustments:
* Fritzbox UPNP interface does not need username/password
* Don't update the record if the IP has not changed
* Set TTL for DNS entry to 60 seconds instead of 24 hours
