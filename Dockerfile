FROM fluent/fluentd:v1.0.2-debian

RUN apt-get update \
 && buildDeps=" \
      make gcc g++ libc-dev \
      ruby-dev \
      wget bzip2 gnupg dirmngr \
    " \
 && apt-get install -y --no-install-recommends $buildDeps \
 && gem install fluent-plugin-record-reformer \
 && gem install fluent-plugin-systemd \
 && gem install fluent-plugin-rewrite-tag-filter \
 && gem install fluent-plugin-prometheus \
 && gem install fluent-plugin-kubernetes_metadata_filter \
 && gem install fluent-plugin-elasticsearch \
 && apt-get purge -y --auto-remove \
                  -o APT::AutoRemove::RecommendsImportant=false \
                  $buildDeps \
 && rm -rf /var/lib/apt/lists/* \
 && rm -rf /tmp/* /var/tmp/* /usr/lib/ruby/gems/*/cache/*.gem

# COPY fluent.conf general.conf kubernetes.conf output.conf prometheus.conf elasticsearch-template.json /fluentd/etc/

COPY entrypoint.sh /bin/

CMD exec fluentd -c /fluentd/etc/fluent.conf -p /fluentd/plugins
