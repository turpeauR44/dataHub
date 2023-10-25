#!/bin/sh
json_data=$(curl --location 'http://keycloak:8080/realms/libre/protocol/openid-connect/token' \
--header 'Content-Type: application/x-www-form-urlencoded' \
--data-urlencode 'username=admin@libremfg.com' \
--data-urlencode 'password=admin' \
--data-urlencode 'client_id=libreBaas' \
--data-urlencode 'client_secret=pk98t8jVtwF9P8erRHZpLklWtz1TzGTR' \
--data-urlencode 'grant_type=password')
access_token=$(echo $json_data | jq -r '.access_token')
echo "$access_token"
curl -X POST -H "Content-Type:application/octect-stream" -H 'Authorization: Bearer '$access_token'' --data-binary @/schema/schema.sdl http://alpha:8080/admin/schema
echo "DONE"
COUNTER=0
exit 0
