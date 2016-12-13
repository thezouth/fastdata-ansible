#!/bin/bash
if [ $# -ne 2 ]; then
  echo "webscal3r cli-tools change status vm in resource_group"
  echo "USAGE: $0 <start|stop> <resource_group>"
  echo 
  exit 1
fi

parallel_process=32
status_cmd=$1
resource_group=$2
azure vm list | grep $resource_group | awk '{print $3}' | xargs -L 1 -P $parallel_process azure vm $status_cmd $resource_group
