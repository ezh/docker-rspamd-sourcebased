#!/bin/bash
#

PASSWORD=${PASSWORD:-rspamd}

if [[ -n "$PASSWORD" && ! -e "/rspamd/etc/local.d/worker-controller.inc" ]]
then
  echo "password = \"$PASSWORD\";" > /rspamd/etc/local.d/worker-controller.inc
  echo "bind_socket = "*:11334";" >> /rspamd/etc/local.d/worker-controller.inc
fi

chmod a+r /dev/fd/0
chmod a+w /dev/fd/1
chmod a+w /dev/fd/2

RSPAMD_USER_ID=$(id -u rspamd)
RSPAMD_GROUP_ID=$(id -g rspamd)

# Environment variables are set before first run
# Set initial UID:GID
if [ -n "$USER_ID" -a "$USER_ID" != "$RSPAMD_USER_ID" ]
then
    echo Change RSPAMD user id from $RSPAMD_USER_ID to $USER_ID
    usermod -u $USER_ID rspamd
fi
if [ -n "$GROUP_ID" -a "$GROUP_ID" != "$RSPAMD_GROUP_ID" ]
then
    echo Change RSPAMD group id from $RSPAMD_GROUP_ID to $GROUP_ID
    groupmod -g $GROUP_ID rspamd
fi
echo Rspamd user defined as `id rspamd`

chown -R rspamd:rspamd /rspamd

echo "Execute $@"
exec su -p rspamd -s /bin/bash -c '$@' -- - $@
