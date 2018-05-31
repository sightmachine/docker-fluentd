#!/usr/bin/dumb-init /bin/sh

set -e

exec fluentd -c /fluentd/etc/fluent.conf -p /fluentd/plugins --gemfile /fluentd/Gemfile ${FLUENTD_OPT}
