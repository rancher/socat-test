#!/bin/bash

if [ -n ${SOCAT_SSL} ]; then
  # The client certificate has to have the certificate plus the key file
  echo "${SOCAT_CLIENT_CRT}" > server.crt
  echo "${SOCAT_CA_CRT}" > ca.crt
  sed -i '/^$/d' server.crt
  sed -i '/^$/d' ca.crt
  socat -d -d openssl-listen:2375,reuseaddr,pf=ip4,fork,cert=server.crt,cafile=ca.crt UNIX:/var/run/docker.sock
else
  socat -d -d TCP-L:2375,fork UNIX:/var/run/docker.sock
fi
