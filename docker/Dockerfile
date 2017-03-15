FROM buildpack-deps:jessie-curl

EXPOSE 11334 11333

COPY entrypoint.sh /

ARG version=master
ARG user_id=798
ARG rspamd_config="-DNO_SHARED=ON -DCMAKE_INSTALL_PREFIX=/usr \
          -DCONFDIR=/rspamd/etc -DRUNDIR=/rspamd/run -DPLUGINSDIR=/rspamd/plugin \
          -DLOGDIR=/rspamd/log -DRSPAMD_USER='rspamd' \
          -DDBDIR=/rspamd/db -DWANT_SYSTEMD_UNITS=OFF -DENABLE_FULL_DEBUG=OFF \
          -DENABLE_HIREDIS=ON -DENABLE_LUAJIT=ON -DENABLE_GD=ON \
          -DENABLE_PCRE2=OFF -DENABLE_HYPERSCAN=OFF -DENABLE_FANN=ON \
          -DENABLE_JEMALLOC=ON -DENABLE_OPTIMIZATION=OFF
ENV DEBIAN_FRONTEND=noninteractive
RUN set -x && \
    useradd -r -s /bin/false -u ${user_id} rspamd && \
    apt-get update -y && apt-get -y install apt-utils && \
    apt-get install --no-install-recommends --no-install-suggests -y \
        fakeroot make ca-certificates less git vim devscripts debhelper gcc libgd-dev \
        dpkg-dev cmake libevent-dev libglib2.0-dev libgmime-2.6-dev libpcre3-dev libssl-dev \
        libcurl4-openssl-dev libsqlite3-dev perl libopendkim-dev libmilter-dev bison flex \
        libmagic-dev ragel libfann-dev libjemalloc-dev libmemcached-dev libicu-dev libluajit-5.1-dev && \
    git clone --branch ${version} --depth 1 --recursive https://github.com/vstakhov/rspamd /opt/rspamd && \
    mkdir /opt/rspamd.build && cd /opt/rspamd.build && \
    cmake ${rspamd_config} ../rspamd && make && make install && \
    mkdir /rspamd/log && mkdir /rspamd/run && mkdir /rspamd/db && \
    mkdir /rspamd/etc/local.d && mkdir /rspamd/etc/override.d && \
    apt-get purge -y git wget automake autoconf pkg-config gcc && \
    cd / && rm -rf /opt/rspamd* && apt-get clean && \
    rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/* /download/directory

VOLUME ["/rspamd/etc/", "/rspamd/plugin", "/rspamd/run", "/rspamd/log", "/rspamd/db"]

ENTRYPOINT ["/entrypoint.sh"]

CMD [ \
  "/usr/bin/rspamd", \
  "-u rspamd", \
  "-g rspamd", \
  "-f" \
]
