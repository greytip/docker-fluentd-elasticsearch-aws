FROM gcr.io/google_containers/fluentd-elasticsearch:1.6

# Install the JSON-in-JSON plug-in (https://github.com/gmr/fluent-plugin-json-in-json).
RUN /usr/sbin/td-agent-gem install fluent-plugin-json-in-json

# Install the aws-elasticsearch-service plugin (https://github.com/atomita/fluent-plugin-aws-elasticsearch-service).
RUN /usr/sbin/td-agent-gem install faraday_middleware
RUN /usr/sbin/td-agent-gem install fluent-plugin-aws-elasticsearch-service

# Copy the Elasticsearch logstash template.
COPY elasticsearch-template.json /etc/td-agent/elasticsearch-template.json

# Copy the Fluentd configuration file.
COPY td-agent.conf /etc/td-agent/td-agent.conf

# Create Logstash index template & run the Fluentd service.
CMD /usr/sbin/td-agent "$FLUENTD_ARGS" > /var/log/td-agent/td-agent.log
