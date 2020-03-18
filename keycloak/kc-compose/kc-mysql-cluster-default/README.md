PING default mode

PING is the default enabled clustering solution of Keycloak using UDP protocol, and you don't need to do any configuration for this.
But PING is only available when multicast network is enabled and port 55200 should be exposed, e.g. bare metals, VMs, docker containers in the same host.
