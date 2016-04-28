#!/bin/bash

IP=$(ip addr list eth0 |grep "inet " |cut -d' ' -f6|cut -d/ -f1)
exec /opt/jboss/infinispan-server/bin/standalone.sh -c clustered.xml -Djgroups.join_timeout=1000 -Djgroups.bind_addr=$IP -Djboss.bind.address=$IP -Djboss.default.jgroups.stack=tcp-gossip -Djgroups.gossip.initial_hosts=$JGROUPS_GOSSIP_SERVICE_HOST[$JGROUPS_GOSSIP_SERVICE_PORT] "$@"
