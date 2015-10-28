# docker-fluentd-elasticsearch-aws
This container is based on [gcr.io/google_containers/fluentd-elasticsearch](https://github.com/kubernetes/kubernetes/blob/master/cluster/addons/fluentd-elasticsearch/fluentd-es-image/Dockerfile) which includes additional functionality:

* Plugins
** JSON-in-JSON parsing via the [fluent-plugin-json-in-json](https://github.com/gmr/fluent-plugin-json-in-json) plugin.
** add aws es service  [fluent-plugin-aws-elasticsearch-service](https://github.com/atomita/fluent-plugin-aws-elasticsearch-service) plugin.

### Intallation requirements

On container you need specify es endpoint in config file under /etc/fluentd/conf.d/*.conf and provide

```
<match "**">
  type "aws-elasticsearch-service"
  logstash_format true
  include_tag_key true
  tag_key "@log_name"
  log_level info

  flush_interval 5s
  # Set the chunk limit the same as for fluentd-gcp.
  buffer_chunk_limit 512K
  # Cap buffer memory usage to 512KB/chunk * 128 chunks = 65 MB
  buffer_queue_limit 128
  flush_interval 5s
  # Never wait longer than 5 minutes between retries.
  max_retry_wait 300
  <endpoint>
    url --> put in endpoint url that points to service.
    region --> put in "eu-central-1"
    access_key_id --> put in your iam-user access_key_id
    secret_access_key --> put in your iam-user secret_access_key
  </endpoint>
</match>
```
