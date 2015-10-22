# docker-fluentd-elasticsearch
This container is based on [gcr.io/google_containers/fluentd-elasticsearch](https://github.com/kubernetes/kubernetes/blob/master/cluster/addons/fluentd-elasticsearch/fluentd-es-image/Dockerfile) which includes additional functionality:

* Plugins
** JSON-in-JSON parsing via the [fluent-plugin-json-in-json](https://github.com/gmr/fluent-plugin-json-in-json) plugin.
** add parsing via the [fluent-plugin-json-in-json](https://github.com/gmr/fluent-plugin-json-in-json) plugin.

### Intallation requirements

On container you need specify endpoints from aws

| ENV var | Description |
|---|---|
| AWS_ENDPOINT_URL | endpoint url that points to service. |
| AWS_REGION | region where elasticsearch service is located in, e.g. eu-central-1, eu-west-1. |

```
