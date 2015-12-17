#!/usr/bin/env bash
set -x

# SIGTERM-handler
term_handler() {
  exit 143; # 128 + 15 -- SIGTERM
}

trap 'kill ${!}; term_handler' SIGTERM

/usr/sbin/td-agent $FLUENTD_ARGS -o /var/log/td-agent/td-agent.log 

