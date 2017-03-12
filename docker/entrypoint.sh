#!/bin/bash
#

PASSWORD=${PASSWORD:-rspamd}

if [[ -n "$PASSWORD" ]]
then
  echo "password = \"$PASSWORD\";" > /rspamd/etc/local.d/worker-controller.inc
  echo "bind_socket = "*:11334";" >> /rspamd/etc/local.d/worker-controller.inc
fi

chmod a+r /dev/fd/0
chmod a+w /dev/fd/1
chmod a+w /dev/fd/2

exec $@
