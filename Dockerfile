FROM organizeme/docker-fluentd-elasticsearch-aws

COPY start.sh /start.sh
RUN chmod +x /start.sh

# Create Logstash index template & run the Fluentd service.
CMD ["/start.sh"]

