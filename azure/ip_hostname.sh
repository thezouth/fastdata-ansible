#!/bin/bash
if [ $# -eq 0 ]; then
  echo "webscal3r cli-tools list ip_address and host in resource_group"
  echo "USAGE: $0 <resource_group>"
  echo 
  exit 1
fi

resource_group=$1
azure vm list-ip-address | grep $resource_group | awk '{print $4 "\t"  $3}'
