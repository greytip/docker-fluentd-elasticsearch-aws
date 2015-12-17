FROM organizeme/docker-fluentd-elasticsearch-aws

RUN /usr/sbin/td-agent-gem install fluent-plugin-docker_metadata_filter

COPY start.sh /start.sh
RUN chmod +x /start.sh

# Create Logstash index template & run the Fluentd service.
CMD ["/start.sh"]

