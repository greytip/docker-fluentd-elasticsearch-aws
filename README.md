# docker-fluentd-elasticsearch-aws
This container is based on [gcr.io/google_containers/fluentd-elasticsearch](https://github.com/kubernetes/kubernetes/blob/master/cluster/addons/fluentd-elasticsearch/fluentd-es-image/Dockerfile) which includes additional functionality:

* Plugin JSON-in-JSON 
JSON-in-JSON parsing via the [fluent-plugin-json-in-json](https://github.com/gmr/fluent-plugin-json-in-json) plugin.

* Plugin AWS elasticsearch service 
add aws es service via the [fluent-plugin-aws-elasticsearch-service](https://github.com/atomita/fluent-plugin-aws-elasticsearch-service) plugin.

* Plugin Docker metadata 
add docker metadata via the [fluent-plugin-docker_metadata_filter](https://github.com/fabric8io/fluent-plugin-docker_metadata_filter) plugin.

* Plugin AWS EC2 metadata 
add AWS EC2 metadata via the [fluent-plugin-ec2-metadata](https://github.com/takus/fluent-plugin-ec2-metadata) plugin.

### Installation requirements

You need to pass ElasticSearch endpoint, region, and credentials as environment variables:


```
docker run -d --restart=always \
   -e ES_ENDPOINT="https://search-xxx-xxx.ap-southeast-1.es.amazonaws.com" \
   -e ES_REGION="ap-southeast-1" \
   -e AWS_ACCESS_KEY_ID="AKIAXXX"  \
   -e AWS_SECRET_ACCESS_KEY="xxx#$XX12" \
   -v /var/run/docker.sock:/var/run/docker.sock \
   -v /var/lib/docker/containers:/var/lib/docker/containers \
   --net=host \
   --name fluent-aws-es \
    greytip/fluent-aws-es:latest
```

While the `td-agent.conf` does not need any changes, you can always override it by passing your own config file as a volume.

```
   -v /home/xxx/my-td-agent.conf":/etc/td-agent/td-agent.conf"
```
