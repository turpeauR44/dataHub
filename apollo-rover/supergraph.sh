#!/bin/sh
curl -sSL https://rover.apollo.dev/nix/latest | sh | sleep 5
echo "export path" && export PATH=/root/.rover/bin:$PATH &&
echo "composing supergraph" && rover supergraph compose --config /local-dev/supergraph-docker.yaml --output supergraph-docker.graphql --elv2-license=accept && sleep 5
mv /dist/supergraph-docker.graphql /local-dev/router