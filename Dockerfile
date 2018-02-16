FROM fluent/fluentd:v1.1.0-debian

USER root

RUN apt-get update \
 && buildDeps=" \
      make gcc g++ libc-dev \
      ruby-dev \
      wget bzip2 gnupg dirmngr \
    " \
 && apt-get install -y --no-install-recommends $buildDeps \
 && gem install fluent-plugin-record-reformer -v 0.9.1 \
 && gem install fluent-plugin-systemd -v 0.3.1 \
 && gem install fluent-plugin-rewrite-tag-filter -v 2.0.2 \
 && gem install fluent-plugin-prometheus -v 1.0.1 \
 && gem install fluent-plugin-kubernetes_metadata_filter -v 1.0.1 \
 && gem install fluent-plugin-elasticsearch -v 2.6.0 \
 && apt-get purge -y --auto-remove \
                  -o APT::AutoRemove::RecommendsImportant=false \
                  $buildDeps \
 && rm -rf /var/lib/apt/lists/* \
 && rm -rf /tmp/* /var/tmp/* /usr/lib/ruby/gems/*/cache/*.gem

ENTRYPOINT []

CMD exec fluentd -c /fluentd/etc/fluent.conf -p /fluentd/plugins
