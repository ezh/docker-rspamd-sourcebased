docker-rspamd-sourcebased
=======================
[![Build Status](https://travis-ci.org/ezh/docker-rspamd-sourcebased.png?branch=master)](https://travis-ci.org/ezh/docker-rspamd-sourcebased) [![Pulls](https://img.shields.io/docker/pulls/ezh1k/rspamd.svg)](https://hub.docker.com/r/ezh1k/rspamd/) [![Releases](https://img.shields.io/github/release/ezh/docker-rspamd-sourcebased.svg)](https://github.com/ezh/docker-rspamd-sourcebased/releases) [![License](https://img.shields.io/github/license/ezh/docker-rspamd-sourcebased.svg)](https://github.com/ezh/docker-rspamd-sourcebased/blob/master/LICENSE)

Source based Rspamd on Debian Jessie

Rspamd build from source from https://github.com/vstakhov/rspamd

By default it builds the stable [![Releases](https://img.shields.io/github/release/ezh/docker-rspamd-sourcebased.svg)](https://github.com/ezh/docker-rspamd-sourcebased/releases) if you use docker compose and latest unstable *master* if you build directly from Dockerfile.

[Hint #1](https://github.com/ezh/docker-rspamd-sourcebased/blob/master/docker/Dockerfile#L7),
[Hint #2](https://github.com/ezh/docker-rspamd-sourcebased/blob/master/docker-compose.travis.yml#L7)

Image is based on `debian/jessie`, the same as an official Jenkis docker container.

Execution
---------

Rspamd executed directly as PID 1 process with logging to `STDOUT`.

Environment
-----------

You may provide rspamd user id with USER_ID environment variable and group id with GROUP_ID one.

Build arguments
---------

You may set rspamd version via `version` argument.

You may set UID for rspamd user via `user_id` argument.

Build parameters
----------------

You may alter build parameters of `Rspamd` with `rspamd_config` argument.

Default configuration:

```
-DCMAKE_INSTALL_PREFIX=/usr
-DCONFDIR=/rspamd/etc
-DDBDIR=/rspamd/db
-DENABLE_FANN=ON
-DENABLE_FULL_DEBUG=OFF
-DENABLE_GD=ON
-DENABLE_HIREDIS=ON
-DENABLE_HYPERSCAN=OFF
-DENABLE_JEMALLOC=ON
-DENABLE_LUAJIT=ON
-DENABLE_OPTIMIZATION=OFF
-DENABLE_PCRE2=OFF
-DLOGDIR=/rspamd/log
-DNO_SHARED=ON
-DPLUGINSDIR=/rspamd/plugin
-DRSPAMD_USER='rspamd'
-DRUNDIR=/rspamd/run
-DWANT_SYSTEMD_UNITS=OFF
```

Copyright
---------

Copyright © 2017 Alexey B. Aksenov/Ezh. All rights reserved.
