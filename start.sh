#!/usr/bin/env bash
set -x

# SIGTERM-handler
term_handler() {
  exit 143; # 128 + 15 -- SIGTERM
}

trap 'kill ${!}; term_handler' SIGTERM

sed -ie "s/ES_ENDPOINT/${ES_ENDPOINT}/g" /etc/td-agent/td-agent.conf
sed -ie "s/ES_REGION/${ES_REGION}/g" /etc/td-agent/td-agent.conf
sed -ie "s/AWS_ACESS_KEY_ID/${AWS_ACCESS_KEY_ID}/g" /etc/td-agent/td-agent.conf
sed -ie "s/AWS_SECRET_ACCESS_KEY/${AWS_SECRET_ACCESS_KEY}/g" /etc/td-agent/td-agent.conf


/usr/sbin/td-agent $FLUENTD_ARGS -o /var/log/td-agent/td-agent.log 

