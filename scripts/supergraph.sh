#!/bin/sh
curl -sSL https://rover.apollo.dev/nix/latest | sh --force | sleep 5
echo "export path" && export PATH=/root/.rover/bin:$PATH &&
echo "composing supergraph" && rover supergraph compose --config /scripts/supergraph.yaml --output supergraph.graphql --elv2-license=accept && sleep 5
mv /dist/supergraph.graphql /scripts