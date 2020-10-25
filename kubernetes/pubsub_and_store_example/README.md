### In this example SWIR sidecars are used to :

 * Store data in Redis
 * Send and receive messages to/from Kafka and Nats brokers.
 * Trace the flow of messages and send it to Jaeger UI

### PubSub and Store Example in Kubernetes
![PubSub and Store Example in Kubernetes](../../graphics/example-solution-k8s.png)

### Running this example :

```./run_example.sh pubsub```

#### it will take a while for a solution to stabilize

### Get URL for tracing dashboard

```../tracing_dashboard.sh pubsub```

### To check logs run : 

```./display_source_logs.sh pubsub ```

```./display_sink_logs.sh pubsub ```


### Cleaning up resources:

```./cleanup_example.sh pubsub```
