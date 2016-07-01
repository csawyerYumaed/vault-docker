#!/bin/sh
VER=v0.6.0-rebuild
git clone https://github.com/hashicorp/vault vault-src
cp vault.hcl vault-src/
cp Dockerfile vault-src/
#./gencert.sh
#if [ $? != 0 ]
#  then
#	echo "error getting certs"
#	exit;
#  fi
cp server.key vault-src/
cp server.crt vault-src/
cd vault-src
git checkout $VER
docker run --rm -v "$(pwd):/src" -v /var/run/docker.sock:/var/run/docker.sock -e OUTPUT=bin/vault centurylink/golang-builder cpvault:$VER
