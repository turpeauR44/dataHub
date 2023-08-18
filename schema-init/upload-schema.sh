#!/bin/sh
echo "Starting wait.sh"
URL="${1:-http://alpha:8080/graphql}"
COUNTER=20
until [ $COUNTER -lt 1 ]; do
  string="$(curl --connect-timeout 5 --max-time 10 --retry 5 --retry-delay 0 --retry-max-time 60 --retry-connrefused --silent $URL)"
  for reqsubstr in 'no query string supplied in request';do
    if [ -z "${string##*$reqsubstr*}" ] ;then
      curl -X POST -H "Content-Type:application/octect-stream" --data-binary @/schema/schema.sdl http://alpha:8080/admin/schema
      echo "DONE"
      COUNTER=0
      exit 0
    else
      echo "Waiting for Libre Baas to be ready..."
      COUNTER=$((COUNTER-1))
      sleep 3
    fi
  done
done 
exit 1
